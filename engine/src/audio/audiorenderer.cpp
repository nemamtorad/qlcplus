/*
  Q Light Controller Plus
  audiorenderer.cpp

  Copyright (c) Massimo Callegari

  This program is free software; you can redistribute it and/or
  modify it under the terms of the GNU General Public License
  Version 2 as published by the Free Software Foundation.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details. The license is
  in the file "COPYING".

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
*/

#include <QDebug>

#include "audiorenderer.h"
#include "qlcmacros.h"

AudioRenderer::AudioRenderer (QObject* parent)
    : QThread (parent)
    , m_userStop(true)
    , m_pause(false)
    , m_intensity(1.0)
    , audioDataRead(0)
    , pendingAudioBytes(0)
{
}

void AudioRenderer::setDecoder(AudioDecoder *adec)
{
    m_adec = adec;
}

void AudioRenderer::adjustIntensity(qreal fraction)
{
    m_intensity = CLAMP(fraction, 0.0, 1.0);
}

void AudioRenderer::stop()
{
    m_userStop = true;
    while (this->isRunning())
        usleep(10000);
    m_intensity = 1.0;
}

void AudioRenderer::run()
{
    m_userStop = false;
    audioDataRead = 0;
    AudioParameters params = m_adec->audioParameters();
    int sampleSize = params.format() + 1;

    while (!m_userStop)
    {
        m_mutex.lock();
        qint64 audioDataWritten = 0;
        if (m_pause == false)
        {
          //qDebug() << "Pending audio bytes: " << pendingAudioBytes;
          if (pendingAudioBytes == 0)
          {
            audioDataRead = m_adec->read((char *)audioData, 8192);
            if (audioDataRead == 0)
            {
                m_mutex.unlock();
                return;
            }
            if (m_intensity != 1.0)
            {
                for (int i = 0; i < audioDataRead; i+=sampleSize)
                {
                    if (sampleSize == 2)
                    {
                        short sample = ((short)audioData[i+1] << 8) + (short)audioData[i];
                        sample *= m_intensity;
                        audioData[i+1] = (sample >> 8) & 0x00FF;
                        audioData[i] = sample & 0x00FF;
                    }
                    else if (sampleSize == 3)
                    {
                        long sample = ((long)audioData[i+2] << 16) + ((long)audioData[i+1] << 8) + (short)audioData[i];
                        sample *= m_intensity;
                        audioData[i+2] = (sample >> 16) & 0x000000FF;
                        audioData[i+1] = (sample >> 8) & 0x000000FF;
                        audioData[i] = sample & 0x000000FF;
                    }
                    else if (sampleSize == 4)
                    {
                        long sample = ((long)audioData[i+3] << 24) + ((long)audioData[i+2] << 16) +
                                      ((long)audioData[i+1] << 8) + (short)audioData[i];
                        sample *= m_intensity;
                        audioData[i+3] = (sample >> 24) & 0x000000FF;
                        audioData[i+2] = (sample >> 16) & 0x000000FF;
                        audioData[i+1] = (sample >> 8) & 0x000000FF;
                        audioData[i] = sample & 0x000000FF;
                    }
                    else // this can be PCM_S8 or unknown. In any case perform byte per byte scaling
                        audioData[i] = (unsigned char)((char)audioData[i] * m_intensity);
                }
            }
            audioDataWritten = writeAudio(audioData, audioDataRead);
            if (audioDataWritten < audioDataRead)
            {
                pendingAudioBytes = audioDataRead - audioDataWritten;
                usleep(15000);
            }
          }
          else
          {
            audioDataWritten = writeAudio(audioData + (audioDataRead - pendingAudioBytes), pendingAudioBytes);
            pendingAudioBytes -= audioDataWritten;
            if (audioDataWritten == 0)
                usleep(15000);
          }
          //qDebug() << "[Cycle] read: " << audioDataRead << ", written: " << audioDataWritten;
        }
        else
            usleep(15000);
        m_mutex.unlock();
    }

    reset();
}

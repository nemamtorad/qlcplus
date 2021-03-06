include(../../variables.pri)
include(../../coverage.pri)

TEMPLATE = lib
LANGUAGE = C++
TARGET   = qlcplusui

CONFIG += qt
QT     += core xml gui script

# Engine
INCLUDEPATH     += ../../engine/src ../../engine/src/audio
DEPENDPATH      += ../../engine/src
QMAKE_LIBDIR    += ../../engine/src
LIBS            += -lqlcplusengine
win32:QMAKE_LFLAGS += -shared

# Types
INCLUDEPATH += ../../plugins/interfaces

# Resources
RESOURCES    += qlcui.qrc

# Sources
HEADERS += aboutbox.h \
           addchannelsgroup.h \
           addfixture.h \
           addresstool.h \
           addvcbuttonmatrix.h \
           addvcslidermatrix.h \
           app.h \
           apputil.h \
           assignhotkey.h \
           audioeditor.h \
           audiotriggersconfiguration.h \
           audiotriggerfactory.h \
           audiotriggerwidget.h \
           channelsselection.h \
           chasereditor.h \
           clickandgoslider.h \
           clickandgowidget.h \
           collectioneditor.h \
           consolechannel.h \
           createfixturegroup.h \
           cuestackmodel.h \
           docbrowser.h \
           dmxslider.h \
           dmxdumpfactory.h \
           efxeditor.h \
           efxpreviewarea.h \
           fixtureconsole.h \
           fixturegroupeditor.h \
           fixturemanager.h \
           fixtureselection.h \
           functionmanager.h \
           fixtureremap.h \
           functionselection.h \
           functionwizard.h \
           grandmasterslider.h \
           groupsconsole.h \
           inputchanneleditor.h \
           inputoutputmanager.h \
           inputoutputpatcheditor.h \
           inputprofileeditor.h \
           knobwidget.h \
           monitor.h \
           monitorfixture.h \
           monitorlayout.h \
           multitrackview.h \
           playbackslider.h \
           remapwidget.h \
           rgbmatrixeditor.h \
           rgbitem.h \
           sceneeditor.h \
           sceneitems.h \
           sceneselection.h \
           scripteditor.h \
           selectinputchannel.h \
           showeditor.h \
           showmanager.h \
           simpledesk.h \
           simpledeskengine.h \
           speeddial.h \
           speeddialwidget.h \
           vcbutton.h \
           vcbuttonproperties.h \
           vccuelist.h \
           vccuelistproperties.h \
           vcdockarea.h \
           vcframe.h \
           vcframeproperties.h \
           vclabel.h \
           vcproperties.h \
           vcpropertieseditor.h \
           vcslider.h \
           vcsliderproperties.h \
           vcsoloframe.h \
           vcspeeddial.h \
           vcspeeddialproperties.h \
           vcwidget.h \
           vcwidgetproperties.h \
           vcwidgetselection.h \
           vcxypad.h \
           vcxypadarea.h \
           vcxypadfixture.h \
           vcxypadfixtureeditor.h \
           vcxypadproperties.h \
           virtualconsole.h

FORMS += aboutbox.ui \
         addchannelsgroup.ui \
         addfixture.ui \
         addresstool.ui \
         addvcbuttonmatrix.ui \
         addvcslidermatrix.ui \
         assignhotkey.ui \
         audioeditor.ui \
         audiotriggersconfiguration.ui \
         audiotriggerfactory.ui \
         chasereditor.ui \
         channelsselection.ui \
         collectioneditor.ui \
         createfixturegroup.ui \
         dmxdumpfactory.ui \
         efxeditor.ui \
         fixturegroupeditor.ui \
         fixtureremap.ui \
         fixtureselection.ui \
         functionselection.ui \
         functionwizard.ui \
         inputchanneleditor.ui \
         inputoutputpatcheditor.ui \
         inputprofileeditor.ui \
         rgbmatrixeditor.ui \
         sceneeditor.ui \
         sceneselection.ui \
         scripteditor.ui \
         selectinputchannel.ui \
         showeditor.ui \
         vcbuttonproperties.ui \
         vccuelistproperties.ui \
         vcframeproperties.ui \
         vcproperties.ui \
         vcsliderproperties.ui \
         vcspeeddialproperties.ui \
         vcwidgetselection.ui \
         vcxypadfixtureeditor.ui \
         vcxypadproperties.ui

SOURCES += aboutbox.cpp \
           addchannelsgroup.cpp \
           addfixture.cpp \
           addresstool.cpp \
           addvcbuttonmatrix.cpp \
           addvcslidermatrix.cpp \
           app.cpp \
           apputil.cpp \
           assignhotkey.cpp \
           audioeditor.cpp \
           audiotriggersconfiguration.cpp \
           audiotriggerfactory.cpp \
           audiotriggerwidget.cpp \
           channelsselection.cpp \
           chasereditor.cpp \
           clickandgoslider.cpp \
           clickandgowidget.cpp \
           collectioneditor.cpp \
           consolechannel.cpp \
           createfixturegroup.cpp \
           cuestackmodel.cpp \
           docbrowser.cpp \
           dmxslider.cpp \
           dmxdumpfactory.cpp \
           efxeditor.cpp \
           efxpreviewarea.cpp \
           fixtureconsole.cpp \
           fixturegroupeditor.cpp \
           fixturemanager.cpp \
           fixtureremap.cpp \
           fixtureselection.cpp \
           functionmanager.cpp \
           functionselection.cpp \
           functionwizard.cpp \
           grandmasterslider.cpp \
           groupsconsole.cpp \
           inputchanneleditor.cpp \
           inputoutputmanager.cpp \
           inputoutputpatcheditor.cpp \
           inputprofileeditor.cpp \
           knobwidget.cpp \
           monitor.cpp \
           monitorfixture.cpp \
           monitorlayout.cpp \
           multitrackview.cpp \
           playbackslider.cpp \
           remapwidget.cpp \
           rgbmatrixeditor.cpp \
           rgbitem.cpp \
           sceneeditor.cpp \
           sceneitems.cpp \
           sceneselection.cpp \
           scripteditor.cpp \
           selectinputchannel.cpp \
           showeditor.cpp \
           showmanager.cpp \
           simpledesk.cpp \
           simpledeskengine.cpp \
           speeddial.cpp \
           speeddialwidget.cpp \
           vcbutton.cpp \
           vcbuttonproperties.cpp \
           vccuelist.cpp \
           vccuelistproperties.cpp \
           vcdockarea.cpp \
           vcframe.cpp \
           vcframeproperties.cpp \
           vclabel.cpp \
           vcproperties.cpp \
           vcpropertieseditor.cpp \
           vcslider.cpp \
           vcsliderproperties.cpp \
           vcsoloframe.cpp \
           vcspeeddial.cpp \
           vcspeeddialproperties.cpp \
           vcwidget.cpp \
           vcwidgetproperties.cpp \
           vcwidgetselection.cpp \
           vcxypad.cpp \
           vcxypadarea.cpp \
           vcxypadfixture.cpp \
           vcxypadfixtureeditor.cpp \
           vcxypadproperties.cpp \
           virtualconsole.cpp


TRANSLATIONS += qlcplus_fi_FI.ts
TRANSLATIONS += qlcplus_fr_FR.ts
TRANSLATIONS += qlcplus_es_ES.ts
TRANSLATIONS += qlcplus_de_DE.ts
TRANSLATIONS += qlcplus_it_IT.ts

macx {
    # This must be after "TARGET = " and before target installation so that
    # install_name_tool can be run before target installation
    include(../../macx/nametool.pri)
}

# Installation
target.path = $$INSTALLROOT/$$LIBSDIR
INSTALLS   += target

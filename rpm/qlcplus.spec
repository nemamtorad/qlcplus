%define version %(echo $QLCPLUS_VERSION)

Summary: Q Light Controller Plus - The free DMX lighting console
License: GPLv2
Group: Other
Name: qlcplus
Prefix: /usr
Provides: qlcplus
BuildRequires: qt-devel >= 4.6, libftdi-devel >= 0.17, libusb-devel >= 0.1.12, alsa-lib-devel >= 1.0.23
Requires: qt >= 4.6
Release: 1
Source: qlcplus-%{version}.tar.gz
URL: https://sourceforge.net/projects/qlcplus/
Buildroot: /tmp/qlcplusrpm
Version: %{version}
%description
Q Light Controller - The free Linux DMX lighting desk. Includes also fixture definitions, input profiles and plugins.

#############################################################################
# Preparation
#############################################################################

%prep
%setup -q

#############################################################################
# Build
#############################################################################

%build
qmake-qt4
make

#############################################################################
# Install
#############################################################################

%install
rm -rf $RPM_BUILD_ROOT
INSTALL_ROOT=$RPM_BUILD_ROOT make install

#############################################################################
# Clean
#############################################################################

#%clean
#rm -rf $RPM_BUILD_ROOT

#############################################################################
# Files
#############################################################################

%files
%defattr(-,root,root)
/usr/bin/qlcplus
/usr/lib/libqlcplusengine*
/usr/lib/libqlcplusui*
/usr/share/qlcplus/translations/*.qm
/usr/share/applications/qlcplus.desktop
/usr/share/pixmaps/qlcplus.png
/usr/bin/qlcplus-fixtureeditor
/usr/share/applications/qlcplus-fixtureeditor.desktop
/usr/share/pixmaps/qlcplus-fixtureeditor.png
/usr/share/qlcplus/fixtures/*
/usr/share/qlcplus/inputprofiles/*
/usr/share/qlcplus/Sample.qxw
/usr/share/mime/packages/qlcplus.xml
%doc /usr/share/qlcplus/documents/*
/usr/lib/qt4/plugins/qlcplus/libartnet.so
/usr/lib/qt4/plugins/qlcplus/libhid.so
/usr/lib/qt4/plugins/qlcplus/libosc.so
/usr/lib/qt4/plugins/qlcplus/libpeperoni.so
/usr/lib/qt4/plugins/qlcplus/libenttecwing.so
/usr/lib/qt4/plugins/qlcplus/libmidiplugin.so
/usr/lib/qt4/plugins/qlcplus/libdmx4linux.so
/usr/lib/qt4/plugins/qlcplus/libdmxusb.so
/usr/lib/qt4/plugins/qlcplus/libudmx.so
/etc/udev/rules.d/z65-dmxusb.rules
/etc/udev/rules.d/z65-anyma-udmx.rules
/etc/udev/rules.d/z65-peperoni.rules


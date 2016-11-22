#!/bin/sh

gnomever=$(echo $(gnome-shell --version) | cut -d ' ' -f 3 | cut -d . -f -2)
srcdir=$(cd $(dirname $0)/../src && pwd)
themedir=/usr/share/themes/Flat-Plat-compact

install -d ${themedir}


# Copy COPYING
cd $(cd $(dirname $0)/.. && pwd)
cp -ur \
	COPYING \
	${themedir}


# Install index.theme
cd ${srcdir}
cp -ur \
	index-compact.theme \
	${themedir}/index.theme


# Install Chrome Theme/Extention
install -d ${themedir}/chrome
cd ${srcdir}/chrome
cp -ur \
	"Flat-Plat Scrollbars.crx" \
	"Flat-Plat Theme.crx" \
	${themedir}/chrome


# Install GNOME Shell Theme
install -d ${themedir}/gnome-shell
cd ${srcdir}/gnome-shell/${gnomever}
cp -ur \
	extensions \
	no-events.svg \
	no-notifications.svg \
	process-working.svg \
	${themedir}/gnome-shell
cp -ur \
	assets \
	${themedir}/gnome-shell
cp -ur \
	gnome-shell-compact.css \
	${themedir}/gnome-shell/gnome-shell.css
glib-compile-resources \
	--sourcedir=${themedir}/gnome-shell \
	--target=${themedir}/gnome-shell/gnome-shell-theme.gresource \
	gnome-shell-theme.gresource.xml


# Install GTK+ 2 Theme
install -d ${themedir}/gtk-2.0
cd ${srcdir}/gtk-2.0
cp -ur \
	apps.rc \
	main.rc \
	${themedir}/gtk-2.0
cp -ur \
	assets \
	${themedir}/gtk-2.0
cp -ur \
	gtkrc \
	${themedir}/gtk-2.0


# Install GTK+ 3 Theme
install -d ${themedir}/gtk-3.0
cd ${srcdir}/gtk-3.0/3.18
cp -ur \
	assets \
	${themedir}/gtk-3.0
cp -ur \
	gtk-compact.css \
	${themedir}/gtk-3.0/gtk.css
cp -ur \
	gtk-dark-compact.css \
	${themedir}/gtk-3.0/gtk-dark.css


install -d ${themedir}/gtk-3.20
cd ${srcdir}/gtk-3.0/3.20
cp -ur \
	assets \
	${themedir}/gtk-3.20
cp -ur \
	gtk-compact.css \
	${themedir}/gtk-3.20/gtk.css
cp -ur \
	gtk-dark-compact.css \
	${themedir}/gtk-3.20/gtk-dark.css


install -d ${themedir}/gtk-3.22
cd ${srcdir}/gtk-3.0/3.22
cp -ur \
	assets \
	${themedir}/gtk-3.22
cp -ur \
	gtk-compact.css \
	${themedir}/gtk-3.22/gtk.css
cp -ur \
	gtk-dark-compact.css \
	${themedir}/gtk-3.22/gtk-dark.css


# Install Metacity Theme
install -d ${themedir}/metacity-1
cd ${srcdir}/metacity-1
cp -ur \
	*.svg \
	${themedir}/metacity-1
cp -ur \
	metacity-theme-2.xml \
	${themedir}/metacity-1
cp -ur \
	metacity-theme-3.xml \
	${themedir}/metacity-1


# Install Unity Theme
install -d ${themedir}/unity
cd ${srcdir}/unity
cp -ur \
	*.svg \
	*.png \
	*.json \
	${themedir}/unity
cp -ur \
	buttons \
	${themedir}/unity

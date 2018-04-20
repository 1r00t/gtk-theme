SHELL = /bin/bash
COLOR_VARIANTS = '' '-dark' '-light'
SIZE_VARIANTS = '' '-slim'
COMPONENTS = 'gtk-2.0' 'gtk-3.22'
SASSC_OPT=-M -t expanded
BASE_DIR=/usr/share/themes
REPODIR=$(CURDIR)
SRCDIR=$(REPODIR)/src
GNOMEVER=3.26

all: sass assets

assets:

clean:
	-rm -rf build

uninstall:
	-rm -rf $(DESTDIR)/usr/share/themes/Pop
	-rm -rf $(DESTDIR)/usr/share/themes/Pop-dark
	-rm -rf $(DESTDIR)/usr/share/themes/Pop-light
	-rm -rf $(DESTDIR)/usr/share/themes/Pop-compact
	-rm -rf $(DESTDIR)/usr/share/themes/Pop-light-compact
	-rm -rf $(DESTDIR)/usr/share/themes/Pop-dark-compact
	-rm -rf $(DESTDIR)/usr/share/themes/Pop-slim
	-rm -rf $(DESTDIR)/usr/share/themes/Pop-dark-slim
	-rm -rf $(DESTDIR)/usr/share/themes/Pop-light-slim

install:


assets-gtk2:


assets-gtk3:


recolor:


sass: gtk3
	@echo "** Generating the CSS..."

gtk2:


prepare:
	@echo "** Setting up a build environment **"
	mkdir -p build
	for color in $(COLOR_VARIANTS); do \
	  for size in $(SIZE_VARIANTS); do \
	    mkdir -p build/Pop$$size$$color; \
	    for component in $(COMPONENTS); do \
	      cp -r src/$$component build/Pop$$size$$color/; \
	    done; \
	  done; \
	done
	#cp -r src/* build

gtk3: prepare
	@echo "** Generating GTK3..."

	for color in $(COLOR_VARIANTS); do \
	  for size in $(SIZE_VARIANTS); do \
	    for version in '3.20' '3.22'; do \
	      sassc $(SASSC_OPT) src/gtk-3.0/$$version/gtk$$color$$size.{scss,css}; \
	    done; \
	  done; \
	done


.PHONY: all install uninstall gtk3 gtk2 sass recolor assets-gtk3 assets-gtk2 clean install-gnome-shell gnomeshell

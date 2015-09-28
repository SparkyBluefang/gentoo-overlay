# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

SRC_URI=""
DESCRIPTION="Meta ebuild for a desktop environment"
HOMEPAGE=""

LICENSE="metapackage"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+fonts +gnome-compat hdaps opengl pulseaudio scanner +themes xscreensaver"

S="${WORKDIR}"

RDEPEND="
	x11-apps/mesa-progs
	x11-base/xorg-x11

	gnome-extra/cinnamon

	app-crypt/seahorse
	app-misc/fslint
	app-misc/gdmap
	gnome-base/dconf-editor
	gnome-extra/gconf-editor
	gnome-extra/gnome-color-manager
	mate-extra/mate-system-monitor
	mate-extra/mate-utils
	sys-apps/gnome-disk-utility
	sys-apps/gsmartcontrol
	x11-misc/xdg-user-dirs
	x11-misc/xdg-user-dirs-gtk

	x11-terms/guake
	x11-terms/mate-terminal

	app-arch/engrampa
	app-cdr/xfburn
	app-editors/pluma
	app-text/atril
	app-text/fbreader
	gnome-extra/gnome-calculator
	media-gfx/eom
	media-video/mpv

	fonts? (
		media-fonts/corefonts
		media-fonts/dejavu
		media-fonts/kochi-substitute
		media-fonts/mplus-fonts
		media-fonts/mplus-outline-fonts
		media-fonts/vlgothic
	)

	hdaps? (
		app-laptop/hdapsd
		app-laptop/hdapsicon
	)

	pulseaudio? (
		media-sound/pavucontrol
		media-sound/pulseaudio
	)

	scanner? (
		media-gfx/xsane
	)

	themes? (
		virtual/freedesktop-icon-theme
	)

	xscreensaver? (
		x11-misc/xscreensaver
		opengl? (
			x11-misc/rss-glx
		)
	)
"

PDEPEND="virtual/notification-daemon:0"

src_install() {
	if use gnome-compat; then
		dosym /usr/bin/eom /opt/bin/eog
		dosym /usr/bin/atril /opt/bin/evince
		dosym /usr/bin/engrampa /opt/bin/file-roller
		dosym /usr/bin/pluma /opt/bin/gedit
		dosym /usr/bin/mate-screenshot /opt/bin/gnome-screenshot
	fi
}


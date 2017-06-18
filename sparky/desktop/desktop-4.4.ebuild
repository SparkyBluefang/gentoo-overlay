# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

SRC_URI=""
DESCRIPTION="Meta ebuild for a desktop environment"
HOMEPAGE=""

LICENSE="metapackage"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+archive disks +fonts minimal opengl pulseaudio scanner +themes xscreensaver"

S="${WORKDIR}"

RDEPEND="
	app-arch/file-roller
	app-crypt/seahorse
	app-editors/gedit
	app-misc/fslint
	app-text/evince
	gnome-base/dconf-editor
	gnome-extra/cinnamon
	gnome-extra/gconf-editor
	gnome-extra/gnome-calculator
	gnome-extra/nemo-extensions[fileroller]
	mate-extra/mate-system-monitor
	mate-extra/mate-utils
	media-gfx/eog
	media-video/mpv
	sys-apps/qdirstat
	www-plugins/adobe-flash
	x11-base/xorg-x11
	x11-misc/xdg-user-dirs
	x11-misc/xdg-user-dirs-gtk
	x11-terms/guake
	x11-terms/mate-terminal

	archive? (
		app-arch/lha
		app-arch/p7zip
		app-arch/rar
	)

	disks? (
		sys-apps/gnome-disk-utility
		sys-apps/gsmartcontrol
	)

	fonts? (
		media-fonts/corefonts
		media-fonts/dejavu
		media-fonts/kochi-substitute
		media-fonts/mplus-fonts
		media-fonts/mplus-outline-fonts
		media-fonts/vlgothic
	)

	!minimal? (
		app-cdr/xfburn
		app-text/calibre
		app-text/fbreader
		media-sound/audacity
		media-sound/moc
		media-video/vlc
	)

	opengl? (
		x11-apps/mesa-progs
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
		opengl? (
			x11-misc/rss-glx
		)
		x11-misc/xscreensaver
	)
"

PDEPEND="virtual/notification-daemon:0"

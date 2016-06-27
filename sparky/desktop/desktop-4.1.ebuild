# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

SRC_URI=""
DESCRIPTION="Meta ebuild for a desktop environment"
HOMEPAGE=""

LICENSE="metapackage"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+archive disks +fonts gnome2-compat hdaps opengl pulseaudio scanner +themes xscreensaver"

S="${WORKDIR}"

RDEPEND="
	app-cdr/xfburn
	app-crypt/seahorse
	app-misc/fslint
	app-misc/gdmap
	app-text/calibre
	app-text/fbreader
	gnome-base/dconf-editor
	gnome-extra/cinnamon
	gnome-extra/gconf-editor
	gnome-extra/gnome-calculator
	mate-extra/mate-system-monitor
	mate-extra/mate-utils
	media-sound/audacity
	media-sound/moc
	media-video/mpv
	media-video/vlc
	www-plugins/adobe-flash
	www-plugins/google-talkplugin
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

	gnome2-compat? (
		app-arch/engrampa
		app-editors/pluma
		app-text/atril
		gnome-extra/nemo-extensions[fileroller,engrampa]
		media-gfx/eom
	)

	!gnome2-compat? (
		app-arch/file-roller
		app-editors/gedit
		app-text/evince
		gnome-extra/nemo-extensions[fileroller,-engrampa]
		media-gfx/eog
	)

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

src_install() {
	if use gnome2-compat; then
		dosym /usr/bin/eom /opt/bin/eog
		dosym /usr/bin/atril /opt/bin/evince
		dosym /usr/bin/engrampa /opt/bin/file-roller
		dosym /usr/bin/pluma /opt/bin/gedit
		dosym /usr/bin/mate-screenshot /opt/bin/gnome-screenshot
	fi
}


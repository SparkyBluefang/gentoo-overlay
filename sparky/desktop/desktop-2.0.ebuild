# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

SRC_URI=""
DESCRIPTION="Meta ebuild for a desktop environment"
HOMEPAGE=""

LICENSE="metapackage"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+fonts +gnome-compat hdaps opengl pulseaudio +themes xscreensaver"

S="${WORKDIR}"

RDEPEND="
	gnome-extra/cinnamon

	gnome-extra/gconf-editor
	gnome-extra/gnome-color-manager
	sys-apps/gnome-disk-utility
	mate-extra/mate-system-monitor
	mate-extra/mate-utils

	x11-terms/mate-terminal
	x11-terms/guake

	app-text/fbreader
	app-cdr/xfburn
	gnome-extra/gnome-calculator

	app-arch/engrampa
	app-editors/pluma
	app-text/atril
	media-gfx/eom

	fonts? (
		media-fonts/dejavu
		media-fonts/corefonts
	)

	hdaps? (
		app-laptop/hdapsd
		app-laptop/hdapsicon
	)

	pulseaudio? (
		media-sound/pulseaudio
		media-sound/pavucontrol
	)

	themes? (
		x11-themes/clearlooks-phenix
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


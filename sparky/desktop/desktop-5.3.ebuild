# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

SRC_URI=""
DESCRIPTION="Meta ebuild for a desktop environment"
HOMEPAGE=""

LICENSE="metapackage"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+archive disks +docs +fonts +media minimal pulseaudio +themes"

S="${WORKDIR}"

RDEPEND="
	app-admin/conky
	app-admin/keepassxc
	app-crypt/seahorse
	app-editors/gedit
	app-misc/fslint
	gnome-base/dconf-editor
	gnome-extra/cinnamon
	gnome-extra/gnome-calculator
	gnome-extra/gnome-system-monitor
	media-gfx/gnome-screenshot
	x11-terms/gnome-terminal
	x11-terms/guake

	archive? (
		app-arch/file-roller
		app-arch/lha
		app-arch/p7zip
		app-arch/rar
		gnome-extra/nemo-fileroller
	)

	disks? (
		sys-apps/gsmartcontrol
		sys-apps/qdirstat
		sys-block/gparted
	)

	docs? (
		app-text/evince
		!minimal? (
			app-office/libreoffice
			app-text/calibre
			app-text/fbreader
		)
	)

	fonts? (
		media-fonts/corefonts
		media-fonts/dejavu
		media-fonts/kochi-substitute
		media-fonts/mplus-fonts
		media-fonts/mplus-outline-fonts
		media-fonts/vlgothic
	)

	media? (
		media-gfx/eog
		media-video/mpv
		!minimal? (
			media-gfx/gimp
			media-sound/audacity
			media-sound/moc
			media-video/vlc
			net-misc/youtube-dl
		)
	)

	pulseaudio? (
		media-sound/pavucontrol
		media-sound/pulseaudio
	)

	themes? (
		virtual/freedesktop-icon-theme
	)
"

PDEPEND="virtual/notification-daemon:0"

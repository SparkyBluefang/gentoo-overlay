# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

SRC_URI=""
DESCRIPTION="Meta ebuild for a desktop environment"
HOMEPAGE=""

LICENSE="metapackage"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+archive cups disks +docs +fonts hplip +media minimal opengl pulseaudio scanner +themes"
REQUIRED_USE="hplip? ( cups )"

S="${WORKDIR}"

RDEPEND="
	app-admin/conky
	app-admin/keepassxc
	app-crypt/seahorse
	app-editors/gedit
	gnome-base/dconf-editor
	gnome-extra/cinnamon
	gnome-extra/gnome-calculator
	gnome-extra/gnome-system-monitor
	media-gfx/gnome-screenshot
	x11-base/xorg-x11
	x11-misc/xdg-user-dirs
	x11-misc/xdg-user-dirs-gtk
	x11-terms/gnome-terminal
	x11-terms/guake

	archive? (
		app-arch/file-roller
		app-arch/lha
		app-arch/p7zip
		app-arch/rar
		gnome-extra/nemo-fileroller
	)

	cups? (
		net-print/cups[X]
		hplip? (
			net-print/hplip[scanner=,-X]
		)
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
	
	opengl? (
		x11-apps/mesa-progs
	)

	pulseaudio? (
		media-sound/pavucontrol
		media-sound/pulseaudio
	)

	scanner? (
		media-gfx/sane-backends
		!minimal? (
			media-gfx/xsane
		)
	)

	themes? (
		virtual/freedesktop-icon-theme
	)
"

PDEPEND="virtual/notification-daemon:0"

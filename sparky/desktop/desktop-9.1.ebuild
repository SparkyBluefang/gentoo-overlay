# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="Meta ebuild for a desktop environment"
HOMEPAGE="https://github.com/SparkyBluefang/gentoo-overlay"

S="${WORKDIR}"

LICENSE="BSD"

SLOT="0"
KEYWORDS="amd64 ~arm64"
IUSE="+archive cups disks +docs +fonts hplip +media minimal opengl pulseaudio scanner +themes"
REQUIRED_USE="hplip? ( cups )"

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
	sys-apps/coreutils
	x11-base/xorg-server
	x11-misc/xdg-user-dirs
	x11-misc/xdg-user-dirs-gtk
	x11-terms/gnome-terminal
	x11-terms/guake

	archive? (
		app-arch/file-roller
		app-arch/lha
		app-arch/p7zip
		gnome-extra/nemo-fileroller

		!arm64? (
			app-arch/rar
		)
	)

	cups? (
		net-print/cups[X]

		hplip? (
			net-print/hplip[scanner=,-X]
		)
	)

	disks? (
		sys-block/gparted

		!arm64? (
			sys-apps/gsmartcontrol
			sys-apps/qdirstat
		)
	)

	docs? (
		app-text/evince

		!minimal? (
			app-office/libreoffice

			!arm64? (
				app-text/calibre
			)
		)
	)

	fonts? (
		media-fonts/corefonts
		media-fonts/dejavu
		media-fonts/kochi-substitute
		media-fonts/vlgothic

		media-fonts/font-adobe-100dpi
		media-fonts/font-adobe-75dpi
		media-fonts/font-adobe-utopia-100dpi
		media-fonts/font-adobe-utopia-75dpi
		media-fonts/font-adobe-utopia-type1
		media-fonts/font-alias
		media-fonts/font-arabic-misc
		media-fonts/font-bh-100dpi
		media-fonts/font-bh-75dpi
		media-fonts/font-bh-lucidatypewriter-100dpi
		media-fonts/font-bh-lucidatypewriter-75dpi
		media-fonts/font-bh-ttf
		media-fonts/font-bh-type1
		media-fonts/font-bitstream-100dpi
		media-fonts/font-bitstream-75dpi
		media-fonts/font-bitstream-type1
		media-fonts/font-cronyx-cyrillic
		media-fonts/font-cursor-misc
		media-fonts/font-daewoo-misc
		media-fonts/font-dec-misc
		media-fonts/font-ibm-type1
		media-fonts/font-isas-misc
		media-fonts/font-jis-misc
		media-fonts/font-micro-misc
		media-fonts/font-misc-cyrillic
		media-fonts/font-misc-ethiopic
		media-fonts/font-misc-meltho
		media-fonts/font-misc-misc
		media-fonts/font-mutt-misc
		media-fonts/font-schumacher-misc
		media-fonts/font-screen-cyrillic
		media-fonts/font-sony-misc
		media-fonts/font-sun-misc
		media-fonts/font-winitzki-cyrillic
		media-fonts/font-xfree86-type1

		!arm64? (
			media-fonts/mplus-fonts
			media-fonts/mplus-outline-fonts
		)
	)

	media? (
		media-gfx/eog
		media-video/mpv

		!minimal? (
			media-gfx/gimp
			media-sound/audacity
			media-video/vlc
			net-misc/gallery-dl
			net-misc/yt-dlp
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

src_install() {
	insinto /etc/profile.d
	doins "${FILESDIR}"/xdg_cache_home.sh
	doins "${FILESDIR}"/zzz_user_startx.sh
}

pkg_postinst() {
	if use cups; then
		rc-update add cupsd default
	fi
}

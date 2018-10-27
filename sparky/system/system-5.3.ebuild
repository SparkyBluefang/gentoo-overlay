# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

SRC_URI=""
DESCRIPTION="Meta ebuild for a system environment"
HOMEPAGE=""

LICENSE="metapackage"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="acpi cups dhclient dhcpcd exfat fat hidpi hplip intel ntfs opengl scanner wifi X xscreensaver"

REQUIRED_USE="( ^^ ( dhclient dhcpcd ) )"

S="${WORKDIR}"

RDEPEND="
	app-admin/mcelog
	app-admin/metalog
	app-editors/vim
	app-portage/gentoolkit
	app-portage/layman
	app-shells/bash-completion
	app-vim/vim-spell-en
	media-sound/alsa-utils
	net-dns/ddclient
	net-dns/openresolv
	net-misc/ntp
	sparky/unix-utils
	sys-apps/hdparm
	sys-apps/pciutils
	sys-apps/usbutils
	sys-block/parted
	sys-boot/grub
	sys-kernel/gentoo-sources
	sys-kernel/linux-firmware
	sys-libs/gpm
	sys-process/cronie
	sys-process/lsof
	www-client/links[fbcon,-X]

	acpi? (
		sys-power/acpid
	)

	cups? (
		net-print/cups[X=]
	)

	dhcpcd? (
		net-misc/dhcpcd
	)

	dhclient? (
		net-misc/dhcp[client]
	)

	exfat? (
		sys-fs/exfat-utils
		sys-fs/fuse-exfat
	)

	fat? (
		sys-fs/dosfstools
		sys-fs/mtools
	)

	hidpi? (
		media-fonts/terminus-font
	)

	hplip? (
		net-print/hplip[scanner=,-X]
	)

	intel? (
		sys-firmware/intel-microcode
	)

	ntfs? (
		sys-fs/ntfs3g
	)

	scanner? (
		media-gfx/sane-backends
		X? (
			media-gfx/xsane
		)
	)

	wifi? (
		net-wireless/crda
		net-wireless/wpa_supplicant
	)

	X? (
		x11-base/xorg-x11
		x11-misc/xdg-user-dirs
		x11-misc/xdg-user-dirs-gtk
		opengl? (
			x11-apps/mesa-progs
		)
		xscreensaver? (
			opengl? (
				x11-misc/rss-glx
			)
			x11-misc/xscreensaver
		)
	)
"


# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

SRC_URI=""
DESCRIPTION="Meta ebuild for a system environment"
HOMEPAGE=""

LICENSE="metapackage"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="acpi dhclient dhcpcd exfat fat hidpi intel ntfs"
REQUIRED_USE="^^ ( dhclient dhcpcd )"

S="${WORKDIR}"

RDEPEND="
	app-admin/mcelog
	app-admin/metalog
	app-editors/vim
	app-eselect/eselect-repository
	app-portage/gentoolkit
	app-shells/bash-completion
	app-vim/vim-spell-en
	media-sound/alsa-utils
	net-dns/ddclient
	net-dns/openresolv
	net-misc/networkmanager
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

	intel? (
		sys-firmware/intel-microcode
	)

	ntfs? (
		sys-fs/ntfs3g
	)
"


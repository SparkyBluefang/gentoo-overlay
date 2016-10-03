# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

SRC_URI=""
DESCRIPTION="Meta ebuild for a system environment"
HOMEPAGE=""

LICENSE="metapackage"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="acpi cups dhclient dhcpcd hidpi hplip intel opengl scanner wifi"

S="${WORKDIR}"

RDEPEND="
	app-admin/mcelog
	app-admin/metalog
	app-editors/vim
	app-editors/nano
	app-portage/gentoolkit
	app-portage/layman
	app-shells/bash-completion
	app-vim/vim-spell-en
	media-sound/alsa-utils
	net-dns/ddclient
	net-dns/openresolv
	net-firewall/iptables
	net-misc/ntp
	sparky/unix-utils
	sys-apps/hdparm
	sys-apps/pciutils
	sys-apps/usbutils
	sys-block/parted
	sys-boot/grub
	sys-boot/os-prober
	sys-fs/dosfstools
	sys-fs/ntfs3g
	sys-kernel/gentoo-sources
	sys-kernel/linux-firmware
	sys-libs/gpm
	sys-power/cpupower
	sys-process/cronie
	sys-process/lsof
	www-client/links

	acpi? (
		sys-power/acpid
	)

	cups? (
		net-print/cups
	)

	dhcpcd? (
		net-misc/dhcpcd
	)

	dhclient? (
		net-misc/dhcp[client]
	)

	hidpi? (
		media-fonts/terminus-font
	)

	hplip? (
		net-print/hplip
	)

	intel? (
		sys-firmware/intel-microcode
	)

	scanner? (
		media-gfx/sane-backends
	)

	wifi? (
		net-wireless/crda
		net-wireless/wpa_supplicant
	)
"


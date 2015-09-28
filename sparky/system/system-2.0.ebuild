# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

SRC_URI=""
DESCRIPTION="Meta ebuild for a system environment"
HOMEPAGE=""

LICENSE="metapackage"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="hplip intel scanner"

S="${WORKDIR}"

RDEPEND="
	app-admin/metalog
	app-portage/gentoolkit
	app-portage/layman
	app-shells/bash-completion
	media-sound/alsa-utils
	net-dns/ddclient
	net-dns/openresolv
	net-firewall/iptables
	net-misc/dhcpcd
	net-misc/ntp
	net-print/cups
	net-wireless/crda
	net-wireless/wpa_supplicant
	sys-apps/pciutils
	sys-apps/usbutils
	sys-boot/grub
	sys-boot/os-prober
	sys-kernel/gentoo-sources
	sys-power/acpid
	sys-power/cpupower
	sys-process/cronie
	sys-process/lsof

	hplip? (
		net-print/hplip
	)

	intel? (
		sys-apps/microcode-data
	)

	scanner? (
		media-gfx/sane-backends
	)
"


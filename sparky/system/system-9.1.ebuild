# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="Meta ebuild for a system environment"
HOMEPAGE="https://github.com/SparkyBluefang/gentoo-overlay"

S="${WORKDIR}"

LICENSE="BSD"

SLOT="0"
KEYWORDS="amd64 ~arm64"
IUSE="acpi dbus elogind exfat fat hidpi intel ntfs portage thinkpad"
REQUIRED_USE="arm64? ( !intel )"

RDEPEND="
	app-admin/metalog
	app-editors/nano
	app-editors/vim
	app-eselect/eselect-repository
	app-portage/gentoolkit
	app-shells/bash-completion
	app-vim/vim-spell-en
	dev-python/virtualenv
	media-sound/alsa-utils
	net-dns/openresolv
	net-misc/networkmanager
	net-misc/ntp
	sparky/unix-utils
	sys-apps/hdparm
	sys-apps/nvme-cli
	sys-apps/pciutils
	sys-apps/usbutils
	sys-apps/util-linux
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

	!arm64? (
		app-admin/mcelog

		intel? (
			sys-firmware/intel-microcode
		)
	)

	dbus? (
		sys-apps/dbus
	)

	elogind? (
		sys-auth/elogind
	)

	exfat? (
		sys-fs/exfatprogs
	)

	fat? (
		sys-fs/dosfstools
		sys-fs/mtools
	)

	hidpi? (
		media-fonts/terminus-font
	)

	ntfs? (
		sys-fs/ntfs3g
	)

	portage? (
		app-portage/iwdevtools
		dev-util/pkgcheck
		dev-util/pkgdev
	)
"

src_install() {
	insinto /etc/bash/bashrc.d
	doins "${FILESDIR}"/aliases.sh

	exeinto /etc/cron.daily
	doexe "${FILESDIR}"/fstrim

	dobin "${FILESDIR}"/wup

	if use thinkpad; then
		exeinto /etc/local.d
		doexe "${FILESDIR}"/thinkpad_logo_led.start
	fi
}

pkg_postinst() {
	if use acpi; then
		rc-update add acpid default
	fi
	if ! use arm64; then
		rc-update add mcelog default
	fi
	if use dbus; then
		rc-update add dbus default
	fi
	if use elogind; then
		rc-update add elogind boot
	fi
	rc-update add consolefont    default
	rc-update add cronie         default
	rc-update add gpm            default
	rc-update add metalog        default
	rc-update add NetworkManager default
	rc-update add ntpd           default
}

# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
PYTHON_COMPAT=( python3_{6,7,8} )

SRC_URI=""
DESCRIPTION="Various helpful system and user utilities"
HOMEPAGE="https://github.com/SparkyBluefang/unix-utils"

LICENSE="BSD"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="cpufreq firewall gentoo grub iptables nftables X"

inherit git-r3 python-single-r1

EGIT_REPO_URI="https://github.com/SparkyBluefang/unix-utils.git"
if [ ${PV} != 9999 ]; then
	EGIT_COMMIT="${PV}"
fi

REQUIRED_USE="firewall? ( ^^ ( iptables nftables ) ) ${PYTHON_REQUIRED_USE}"

RDEPEND="
	sys-apps/coreutils
	virtual/awk
	${PYTHON_DEPS}

	cpufreq? (
		sys-power/cpupower
	)

	firewall? (
		iptables? (
			net-firewall/iptables
		)

		nftables? (
			net-firewall/nftables
		)
	)

	gentoo? (
		app-portage/gentoolkit
		sys-apps/portage
	)

	grub? (
		sys-boot/grub:2
	)
"

src_install() {
	dobin checkburn
	dobin checksums
	dobin delay
	dobin shar2ar

	if use cpufreq; then
		dobin cpufreqd/cpufreqd
		newconfd cpufreqd/cpufreqd.conf cpufreqd
		newinitd cpufreqd/cpufreqd.init cpufreqd
	fi

	if use firewall; then
		newconfd firewall/firewall.conf firewall

		if use iptables; then
			newinitd firewall/firewall.iptables.init firewall
		fi

		if use nftables; then
			newinitd firewall/firewall.nftables.init firewall
		fi
	fi

	if use gentoo; then
		dobin gentoo/wup
	fi

	if use grub; then
		dobin update-grub
	fi

	if use X; then
		dobin update-xorg
	fi
}


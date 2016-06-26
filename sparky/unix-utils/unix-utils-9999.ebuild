# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
PYTHON_COMPAT=( python2_7 )

SRC_URI=""
DESCRIPTION="Various helpful system and user utilities"
HOMEPAGE="https://github.com/SparkyBluefang/unix-utils"

LICENSE="BSD"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="cpufreq firewall gentoo grub intel"

inherit git-r3 python-single-r1

EGIT_REPO_URI="https://github.com/SparkyBluefang/unix-utils.git"
if [ ${PV} != 9999 ]; then
	EGIT_COMMIT="${PV}"
fi

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	sys-apps/coreutils
	virtual/awk
	${PYTHON_DEPS}

	cpufreq? (
		sys-power/cpupower
	)

	firewall? (
		net-firewall/iptables
	)

	gentoo? (
		app-portage/gentoolkit
		sys-apps/portage
	)

	grub? (
		sys-boot/grub:2
	)

	intel? (
		sys-apps/iucode_tool
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
		newinitd firewall/firewall.init firewall
	fi

	if use gentoo; then
		dobin gentoo/wup
	fi

	if use grub; then
		dobin update-grub
	fi

	if use intel; then
		dobin update-intel
	fi
}


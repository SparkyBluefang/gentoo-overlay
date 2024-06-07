# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_{9,10,11,12,13} )

DESCRIPTION="Various helpful system and user utilities"
HOMEPAGE="https://github.com/SparkyBluefang/unix-utils"

LICENSE="BSD"

SLOT="0"
KEYWORDS="amd64 ~arm64 x86"
IUSE="cpufreq firewall grub iptables nftables X"

inherit git-r3 python-single-r1

EGIT_REPO_URI="https://github.com/SparkyBluefang/unix-utils.git"
if [ ${PV} != 9999 ]; then
	EGIT_COMMIT="${PV}"
fi

REQUIRED_USE="firewall? ( ^^ ( iptables nftables ) ) ${PYTHON_REQUIRED_USE}"

RDEPEND="
	sys-apps/coreutils
	app-alternatives/awk
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

	if use grub; then
		dobin update-grub
	fi

	if use X; then
		dobin update-xorg
	fi
}

pkg_postinst() {
	if use cpufreq; then
		rc-update add cpufreqd boot
	fi
	if use firewall; then
		rc-update add firewall boot
	fi
}

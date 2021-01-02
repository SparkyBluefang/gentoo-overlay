# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Nemo file-roller integration"
HOMEPAGE="https://github.com/linuxmint/nemo-extensions"
SRC_URI="https://github.com/linuxmint/nemo-extensions/archive/${PV}.tar.gz -> nemo-extensions-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="gnome-extra/nemo"
RDEPEND="${DEPEND}
	app-arch/file-roller"

S="${WORKDIR}/nemo-extensions-${PV}/${PN}"

src_prepare() {
	default
	eautoreconf
}

src_install() {
	default

	find "${D}" \( -name '*.a' -o -name '*.la' \) -delete || die
}

# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
GNOME2_LA_PUNT="yes"

inherit autotools eutils gnome2

DESCRIPTION="GTK+3 timezone map widget"
HOMEPAGE="https://launchpad.net/timezonemap"
SRC_URI="mirror://ubuntu/pool/main/libt/${PN}/${PN}_${PV}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/glib:2
	dev-libs/json-glib
	net-libs/libsoup
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:3"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
	default
}

src_compile() {
	# Fix sandbox violation Bug 567192
	export -n XDG_CACHE_HOME
	gnome2_src_compile
}

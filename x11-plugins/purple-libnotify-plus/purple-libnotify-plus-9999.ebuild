# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

AUTOTOOLS_AUTORECONF=1

inherit autotools-utils git-r3

DESCRIPTION="Provide libnotify interface to Pidgin and Finch"
HOMEPAGE="http://purple-libnotify-plus.sardemff7.net/"
EGIT_REPO_URI="https://github.com/sardemff7/purple-libnotify-plus.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=net-im/pidgin-2.6.0
	=net-im/purple-events-${PV}
	>=x11-libs/gdk-pixbuf-0.26:2
	>=x11-libs/libnotify-0.7.0
"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35.0
	sys-devel/gettext
	virtual/pkgconfig
"


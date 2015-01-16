# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

AUTOTOOLS_AUTORECONF=1

inherit autotools-utils git-r3

DESCRIPTION="Allows fine-grained control over libpurple events"
HOMEPAGE="http://purple-events.sardemff7.net/"
EGIT_REPO_URI="https://github.com/sardemff7/purple-events.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=net-im/pidgin-2.6.0
"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.40.0
	sys-devel/gettext
	virtual/pkgconfig
"


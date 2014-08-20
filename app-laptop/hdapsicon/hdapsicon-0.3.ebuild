# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python2_{5,6,7} )

inherit python-r1

DESCRIPTION="A PyGTK based HDAPS monitor."
HOMEPAGE="http://thpani.at/projects/hdapsicon.html"
SRC_URI="http://thpani.at/media/downloads/thinkhdaps/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	dev-python/pygtk
	gnome-base/librsvg"

pkg_setup()
{
	python_setup
}

src_install()
{
	emake DESTDIR="${D}" install || die "Install failed"

	insinto /etc/xdg/autostart
	doins "${FILESDIR}/HDAPSicon.desktop"
}

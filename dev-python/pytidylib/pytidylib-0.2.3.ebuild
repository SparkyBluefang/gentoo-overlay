# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Python interface to HTML Tidy"
HOMEPAGE="http://countergram.com/open-source/pytidylib/"
SRC_URI="https://pypi.python.org/packages/source/p/pytidylib/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	app-text/htmltidy"

# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Python interface to JIRA"
HOMEPAGE="http://bitbucket.org/bspeakmon/jira-python"
SRC_URI="https://pypi.python.org/packages/source/j/jira-python/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-python/requests-2.3.0
	>=dev-python/requests-oauthlib-0.3.3
	>=dev-python/tlslite-0.4.3
	sys-apps/file[python]"
DEPEND="
	${RDEPEND}
	dev-python/sphinx"

python_prepare_all() {
	sed -e "/find_packages/s/()/(exclude=['tests', 'tools'])/" -i setup.py || die
}

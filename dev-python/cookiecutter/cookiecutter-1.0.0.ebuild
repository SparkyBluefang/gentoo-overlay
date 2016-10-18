# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Command-line utility to create projects from cookiecutters (project templates)"
HOMEPAGE="https://github.com/audreyr/cookiecutter"
SRC_URI="https://github.com/audreyr/cookiecutter/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND=">=dev-python/binaryornot-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.7[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.10[${PYTHON_USEDEP}]
	<dev-python/click-4.0[${PYTHON_USEDEP}]
	dev-python/mock"

DEPEND="${RDEPEND}
	test? ( dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-mock[${PYTHON_USEDEP}] )"

DOCS=( README.rst HISTORY.rst CONTRIBUTING.rst )

python_test() {
	DISABLE_NETWORK_TESTS=1 py.test || die
}

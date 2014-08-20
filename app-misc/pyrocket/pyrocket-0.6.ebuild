# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

S=${WORKDIR}/${P}.orig

inherit python distutils eutils

DESCRIPTION="A PyGTK based controller for Dream Cheeky and Ninja Gizmos missile launchers."
HOMEPAGE="http://code.google.com/p/pyrocket/"
SRC_URI="http://pyrocket.googlecode.com/files/${PN}_${PV}.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools"

RDEPEND="${DEPEND}
	dev-python/pygtk
	<dev-python/pyusb-1.0.0_alpha1
	dev-python/pygame"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	epatch "${FILESDIR}/${PN}.patch"

	distutils_src_prepare
	python_convert_shebangs -r 2 .

	sed -i -e "s/from opencv import cv, highgui//" ${S}/rocket_joystick.py
}

src_install() {
	distutils_src_install

	insinto /etc/udev/rules.d/
	doins 40-rocketlauncher.rules
}

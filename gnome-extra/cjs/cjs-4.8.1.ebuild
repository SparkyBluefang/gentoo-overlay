# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit meson pax-utils virtualx

DESCRIPTION="Linux Mint's fork of gjs for Cinnamon"
HOMEPAGE="https://projects.linuxmint.com/cinnamon/"
SRC_URI="
	https://github.com/linuxmint/cjs/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/linuxmint/cjs/commit/1210c910935e4e3ab5335725a34adb8f661a8d95.patch -> ${P}-rebase-on-1.66.1.patch
"

LICENSE="MIT || ( MPL-1.1 LGPL-2+ GPL-2+ )"
SLOT="0"
IUSE="+cairo examples gtk readline sysprof test"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
	dev-lang/spidermonkey:78
	>=dev-libs/glib-2.58.0:2
	>=dev-libs/gobject-introspection-1.58.3:=
	>=dev-libs/libffi-3.2.1:0=

	cairo? ( x11-libs/cairo[glib,X] )
	readline? ( sys-libs/readline:0= )
"
DEPEND="${RDEPEND}
	sysprof? ( >=dev-util/sysprof-capture-3.38.1:4 )
	test? (
		sys-apps/dbus

		gtk? ( x11-libs/gtk+:3[introspection] )
	)
"
BDEPEND="
	virtual/pkgconfig
"

PATCHES=(
	# Rebase on gjs 1.66.1 to fix SIGABRT
	# https://github.com/linuxmint/cjs/pull/90
	"${DISTDIR}/${P}-rebase-on-1.66.1.patch"
)

src_configure() {
	local emesonargs=(
		$(meson_feature cairo)
		$(meson_feature readline)
		$(meson_feature sysprof profiler)
		-Dinstalled_tests=false
		$(meson_use !test skip_dbus_tests)
		$(meson_use !test skip_gtk_tests)
	)
	meson_src_configure
}

src_test() {
	virtx meson_src_test
}

src_install() {
	meson_src_install

	if use examples; then
		docinto examples
		dodoc "${S}"/examples/*
	fi

	# Required for cjs-console to run correctly on PaX systems
	pax-mark mr "${ED}/usr/bin/cjs-console"
}

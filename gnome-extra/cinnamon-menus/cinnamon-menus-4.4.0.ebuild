# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit meson gnome2

DESCRIPTION="Cinnamon's library for the Desktop Menu fd.o specification"
HOMEPAGE="http://developer.linuxmint.com/projects/cinnamon-projects.html"
SRC_URI="https://github.com/linuxmint/cinnamon-menus/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+ LGPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug doc"

RDEPEND="
	>=dev-libs/glib-2.29.15:2
	>=dev-libs/gobject-introspection-0.9.12:=
"
DEPEND="${RDEPEND}
	dev-libs/gobject-introspection-common
	>=dev-util/intltool-0.40
	sys-devel/gettext
	virtual/pkgconfig
	doc? ( dev-util/gtk-doc )
"

src_configure() {
	meson_src_configure \
		$(meson_use debug enable_debug) \
		$(meson_use doc enable_docs)
}

src_install() {
	meson_src_install
}

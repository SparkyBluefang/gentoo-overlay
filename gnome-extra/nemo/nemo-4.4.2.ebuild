# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )

inherit meson eutils gnome2-utils python-any-r1 virtualx xdg

DESCRIPTION="A file manager for Cinnamon, forked from Nautilus"
HOMEPAGE="http://developer.linuxmint.com/projects/cinnamon-projects.html"
SRC_URI="https://github.com/linuxmint/nemo/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+ LGPL-2+ FDL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc exif +introspection +nls selinux xmp"
RESTRICT=test

COMMON_DEPEND="
	>=dev-libs/glib-2.37.3:2[dbus]
	>=gnome-extra/cinnamon-desktop-2.6.1:0=
	>=x11-libs/pango-1.28.3
	>=x11-libs/gtk+-3.9.10:3[introspection?]
	>=dev-libs/libxml2-2.7.8:2

	gnome-base/dconf:0=
	gnome-base/gsettings-desktop-schemas
	>=x11-libs/libnotify-0.7:=
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXrender
	>=x11-libs/xapps-1.4.0

	exif? ( >=media-libs/libexif-0.6.20:= )
	introspection? ( >=dev-libs/gobject-introspection-0.6.4:= )
	xmp? ( >=media-libs/exempi-2.2.0:= )
	selinux? ( sys-libs/libselinux )
"
RDEPEND="${COMMON_DEPEND}
	x11-themes/adwaita-icon-theme
	nls? ( >=gnome-extra/cinnamon-translations-2.2 )
"

PDEPEND=">=gnome-base/gvfs-0.1.2"

DEPEND="${COMMON_DEPEND}
	${PYTHON_DEPS}
	$(python_gen_any_dep '
		dev-python/polib[${PYTHON_USEDEP}]
		dev-python/pygobject:3[${PYTHON_USEDEP}]
	')
	>=dev-lang/perl-5
	>=dev-util/gdbus-codegen-2.31.0
	>=dev-util/intltool-0.40.1
	sys-devel/gettext
	virtual/pkgconfig
	x11-base/xorg-proto

	doc? ( dev-util/gtk-doc )
"

src_configure() {
	local emesonargs=(
		$(meson_use exif)
		$(meson_use xmp)
		$(meson_use selinux)
		$(meson_use doc gtk_doc)
	)
	meson_src_configure
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}

# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit meson eutils gnome2-utils xdg

DESCRIPTION="Cinnamon session manager"
HOMEPAGE="http://developer.linuxmint.com/projects/cinnamon-projects.html"
SRC_URI="https://github.com/linuxmint/cinnamon-session/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+ FDL-1.1+ LGPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc elogind ipv6 systemd"
REQUIRED_USE="^^ ( elogind systemd )"

COMMON_DEPEND="
	>=dev-libs/glib-2.37.3:2
	media-libs/libcanberra
	x11-libs/gdk-pixbuf:2
	>=x11-libs/gtk+-3:3
	x11-libs/cairo
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libXcomposite
	x11-libs/libXext
	x11-libs/libXrender
	x11-libs/libXtst
	x11-libs/pango[X]
	>=x11-libs/xapps-1.0.4
	virtual/opengl
	systemd? ( >=sys-apps/systemd-183 )
	elogind? ( sys-auth/elogind[policykit] )
"

RDEPEND="${COMMON_DEPEND}
	>=gnome-extra/cinnamon-desktop-2.6[systemd=]
"
DEPEND="${COMMON_DEPEND}
	dev-libs/libxslt
	>=dev-util/intltool-0.40.6
	virtual/pkgconfig
	doc? ( app-text/xmlto )
"

PATCHES=(
	"${FILESDIR}"/${PN}-3.8.0-elogind.patch
	"${FILESDIR}"/${PN}-3.8.0-elogind2.patch
)

src_configure() {
	local emesonargs=(
		-Dgconf=false
		$(meson_use doc docbook)
		$(meson_use ipv6)
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

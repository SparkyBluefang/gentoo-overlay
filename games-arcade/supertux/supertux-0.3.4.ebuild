# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit cmake-utils games

DESCRIPTION="A classic 2D jump'n run sidescroller game in a style similar to the original Super Mario games."
HOMEPAGE="http://supertux.lethargik.org/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.bz2"
RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="2"
KEYWORDS="~amd64 ~x86"
IUSE="opengl curl"

RDEPEND="media-libs/libsdl[joystick]
	media-libs/sdl-image[png,jpeg]
	media-libs/openal
	media-libs/libvorbis
	media-libs/libogg
	dev-games/physfs
	opengl? ( virtual/opengl media-libs/glew )
	curl? ( net-misc/curl )"
DEPEND="${RDEPEND}
	>=dev-libs/boost-1.41"

src_configure() {
	local mycmakeargs="$(cmake-utils_use_enable opengl OPENGL)
			-DINSTALL_SUBDIR_BIN=games/bin
			-DINSTALL_SUBDIR_DOC=share/doc/${P}"

#			$(cmake-utils_use_enable debug SQDBG)
#			$(cmake-utils_use debug DEBUG)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	prepgamesdirs

	# fix collisions/naming
	mv "${D}/usr/share/pixmaps/supertux.png" "${D}/usr/share/pixmaps/supertux2.png"
	mv "${D}/usr/share/pixmaps/supertux.xpm" "${D}/usr/share/pixmaps/supertux2.xpm"
	sed -i -e "s/supertux.png/supertux2.png/g" "${D}/usr/share/applications/supertux2.desktop"
}

# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_2,3_3} )

inherit autotools

DESCRIPTION="Nemo file manager extensions and integrations"
HOMEPAGE=""
SRC_URI="https://github.com/linuxmint/nemo-extensions/archive/3.0.0.tar.gz"
LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"

MODULES_MAKE="dropbox fileroller gtkhash image-converter preview python repairer seahorse share"
MODULES_PYTHON="audio-tab emblems pastebin"
IUSE="$MODULES_MAKE $MODULES_PYTHON compare engrampa media-columns rabbitvcs terminal"

REQUIRED_USE="
	engrampa? ( fileroller )
	terminal? ( python )
"

#DEPEND="=gnome-extra/nemo-2.8*
#	gtkhash? (
#		
#	)
#	image-converter? (
#		x11-libs/gtk+:3
#	)
#	preview? (
#		
#	)
#	python? (
#		
#	)
#	seahorse? (
#		
#	)
#"
DEPEND="=gnome-extra/nemo-3.0*"

RDEPEND="${DEPEND}
	fileroller? (
		!engrampa? ( app-arch/file-roller )
		engrampa? ( app-arch/engrampa )
	)"

src_prepare() {
	for module in ${MODULES_MAKE}; do
		if use ${module}; then
			elog "Preparing ${module}"
			pushd nemo-${module}
			eautoreconf

			if [ ${module} = "fileroller" ] && use engrampa; then
				sed -i 's/"file-roller/"engrampa/g' src/nemo-fileroller.c
			fi

			popd
		fi
	done
}

src_configure() {
	for module in ${MODULES_MAKE}; do
		if use ${module}; then
			elog "Configuring ${module}"
			pushd nemo-${module}
			econf
			popd
		fi
	done
}

src_compile() {
	for module in ${MODULES_MAKE}; do
		if use ${module}; then
			elog "Compiling ${module}"
			pushd nemo-${module}
			emake
			popd
		fi
	done
}

src_install() {
	for module in ${MODULES_MAKE}; do
		if use ${module}; then
			elog "Installing ${module}"
			pushd nemo-${module}
			emake DESTDIR="${D}" install
			dodoc README
			popd
		fi
	done

	elog "Removing .a and .la files"
	find ${D} -name "*.a" -exec rm {} + -o -name "*.la" -exec rm {} + || die
}


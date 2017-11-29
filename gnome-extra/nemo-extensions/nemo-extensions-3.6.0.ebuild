# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python3_{4,5,6} )

inherit autotools

DESCRIPTION="Nemo file manager extensions and integrations"
HOMEPAGE=""
SRC_URI="https://github.com/linuxmint/nemo-extensions/archive/${PV}.tar.gz"
LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"

MODULES_MAKE="dropbox fileroller gtkhash image-converter preview python repairer seahorse share"
MODULES_PYTHON="audio-tab emblems pastebin"
IUSE="$MODULES_MAKE $MODULES_PYTHON compare media-columns rabbitvcs terminal"

REQUIRED_USE="
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
DEPEND="=gnome-extra/nemo-3.6*"

RDEPEND="${DEPEND}
	fileroller? (
		app-arch/file-roller
	)"

src_prepare() {
	eapply_user
	for module in ${MODULES_MAKE}; do
		if use ${module}; then
			elog "Preparing ${module}"
			pushd nemo-${module}
			eautoreconf
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

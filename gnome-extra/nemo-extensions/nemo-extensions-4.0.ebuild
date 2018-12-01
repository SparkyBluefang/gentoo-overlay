# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

DESCRIPTION="Nemo extensions and integrations"
HOMEPAGE="https://github.com/linuxmint/nemo-extensions"
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="audio-tab compare dropbox emblems fileroller gtkhash image-converter media-columns pastebin preview python repairer seahorse share terminal"

REQUIRED_USE="
	terminal? ( python )
"

PDEPEND=""
for iuse in ${IUSE}; do
	PDEPEND="${PDEPEND} $iuse? ( =gnome-extra/nemo-${iuse}-${PV}* )"
done

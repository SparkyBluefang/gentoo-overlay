# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/xfce-base/xfce4-meta/xfce4-meta-4.10.ebuild,v 1.10 2012/11/28 12:31:00 ssuominen Exp $

EAPI=5

DESCRIPTION="The Xfce Desktop Environment (meta package)"
HOMEPAGE="http://www.xfce.org/"
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 sparc x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~ia64-linux ~x86-linux"
IUSE="minimal +svg +metacity +automount policykit +pulseaudio hdaps"

RDEPEND=">=x11-themes/gtk-engines-xfce-3:0
	x11-themes/hicolor-icon-theme
	x11-themes/gnome-icon-theme
	x11-themes/clearlooks-phenix
	x11-themes/gnome-themes-standard

	>=xfce-base/xfce4-session-4.10
	>=xfce-base/xfce4-settings-4.10
	gnome-extra/gconf-editor
	virtual/notification-daemon
	gnome-extra/nemo
	gnome-extra/nemo-extensions

	>=xfce-base/xfce4-panel-4.10
	xfce-extra/xfce4-cpugraph-plugin
	xfce-extra/xfce4-datetime-plugin
	xfce-extra/xfce4-battery-plugin
	xfce-extra/xfce4-kbdleds-plugin

	app-arch/file-roller
	app-editors/gedit
	app-text/evince
	app-text/fbreader
	media-gfx/eog
	gnome-extra/gnome-system-monitor
	xfce-extra/xfce4-screenshooter
	x11-terms/gnome-terminal
	app-cdr/xfburn
	gnome-extra/gnome-color-manager
	sys-apps/baobab
	media-gfx/gnome-font-viewer
	app-admin/gnome-system-log
	gnome-extra/gcalctool
	sys-apps/gnome-disk-utility
	x11-misc/xscreensaver
	x11-terms/guake

	!minimal? (
		media-fonts/dejavu
		virtual/freedesktop-icon-theme
	)

	metacity? (
		x11-wm/metacity
		x11-themes/gnome-themes
	)

	!metacity? (
		>=xfce-base/xfwm4-4.10
		x11-themes/xfwm4-themes
	)

	svg? (
		gnome-base/librsvg
	)

	policykit? (
		gnome-extra/polkit-gnome
	)

	automount? (
		>=gnome-base/gvfs-1.12.3-r1[udisks]
	)

	hdaps? (
		app-laptop/hdapsd
		app-laptop/hdapsicon
	)

	pulseaudio? (
		media-sound/pulseaudio
		media-sound/paprefs
		media-sound/pavucontrol
		xfce-extra/xfce4-volumed-pulse
	)
"

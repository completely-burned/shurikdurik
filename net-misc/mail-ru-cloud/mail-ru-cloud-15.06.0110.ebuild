# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit unpacker gnome2-utils

DESCRIPTION="Cloud Mail.ru"
HOMEPAGE="https://cloud.mail.ru/"
SRC_URI="amd64? ( https://linuxdesktopcloud.mail.ru/deb/mail.ru-cloud_${PV}_amd64.deb )
	x86? ( https://linuxdesktopcloud.mail.ru/deb/mail.ru-cloud_${PV}_i386.deb )"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror strip"

S=${WORKDIR}

DEPEND=""
RDEPEND="sys-libs/glibc
	x11-libs/libX11
	x11-libs/libXmu
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5"

src_install() {
	insinto /usr/
	doins -r usr/share/

        exeinto /opt/bin
        doexe usr/bin/cloud
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}

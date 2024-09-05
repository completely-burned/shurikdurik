# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop xdg-utils

DESCRIPTION="Tixati P2P Client"
HOMEPAGE="http://www.tixati.com"

PKGREL=1

SRC_URI="
	https://download1.tixati.com/download/${P}-${PKGREL}.x86_64.manualinstall.tar.gz
	https://download2.tixati.com/download/${P}-${PKGREL}.x86_64.manualinstall.tar.gz
	https://download3.tixati.com/download/${P}-${PKGREL}.x86_64.manualinstall.tar.gz
"
	#x86? (	https://download1.tixati.com/download/${P}-${PKGREL}.i686.manualinstall.tar.gz
	#	https://download2.tixati.com/download/${P}-${PKGREL}.i686.manualinstall.tar.gz
	#	https://download3.tixati.com/download/${P}-${PKGREL}.i686.manualinstall.tar.gz
	#)

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror bindist"
IUSE=""

S="${WORKDIR}/${P}-${PKGREL}.x86_64.manualinstall"
#amd64? ( ${WORKDIR}/${P}-${PKGREL}.x86_64.manualinstall )
#x86? ( ${WORKDIR}/${P}-${PKGREL}.i686.manualinstall )

QA_PREBUILT="
	opt/${PN}/${PN}
"

src_install() {
	dodoc *.txt
	doicon ${PN}.png
	domenu ${PN}.desktop

	into /opt/${PN}
	dobin ${PN}
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
}

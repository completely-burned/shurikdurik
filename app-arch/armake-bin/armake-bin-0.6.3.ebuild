# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="A C implementation of Arma modding tools (PAA conversion, binarization/rapification, PBO packing). (WIP)"
HOMEPAGE="https://github.com/KoffeinFlummi/armake"
LICENSE="GPL-2"

SRC_URI="
	http://github.com/KoffeinFlummi/armake/archive/armake_v${PV}.zip
	http://github.com/KoffeinFlummi/armake/releases/download/v${PV}/armake_v${PV}.zip
"
RESTRICT="mirror bindist"
KEYWORDS="amd64"
SLOT="0"

S="${WORKDIR}/armake_v${PV}"

src_install() {
	into /opt/${PN}
	dobin armake
	doenvd ${FILESDIR}/99-${PN}
}

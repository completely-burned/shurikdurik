# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="A C implementation of Arma modding tools (PAA conversion, binarization/rapification, PBO packing). (WIP)"
HOMEPAGE="https://github.com/KoffeinFlummi/armake"
LICENSE="GPL-2"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_SUBMODULES=( '*' )
	EGIT_REPO_URI="https://github.com/KoffeinFlummi/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/KoffeinFlummi/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 x86"
fi

SLOT="0"

BDEPEND="
	dev-libs/openssl
"

src_prepare() {
	default

	# missing separator
	sed -i "s/    /\t/" ${S}/Makefile
}

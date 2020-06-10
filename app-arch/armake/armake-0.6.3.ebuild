# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit git-r3

DESCRIPTION="A C implementation of Arma modding tools (PAA conversion, binarization/rapification, PBO packing). (WIP)"
HOMEPAGE="https://github.com/KoffeinFlummi/armake"
LICENSE="GPL-2"

EGIT_REPO_URI="https://github.com/KoffeinFlummi/${PN}.git"
EGIT_SUBMODULES=( "*" )

if [[ ${PV} == 9999 ]]; then
        KEYWORDS=""
else
    	MY_PV="${PV/_pre/.dev}"
        MY_PV="${MY_PV/_rc/rc}"
        EGIT_COMMIT="v${MY_PV}"
        KEYWORDS="amd64 x86"
fi

SLOT="0"

BDEPEND="
	dev-libs/openssl
"


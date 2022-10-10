# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="8"

inherit cmake git-r3

DESCRIPTION="Custom implementation of the Arma script language SQF"
HOMEPAGE="https://github.com/SQFvm/runtime"
LICENSE="LGPL-3"

EGIT_SUBMODULES=( '*' )
EGIT_REPO_URI="https://github.com/SQFvm/runtime.git"
if [[ "${PV}" != "9999" ]]
then
	MY_PV="${PV/_rc/-RC}"
	EGIT_COMMIT="${MY_PV}"
fi

SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm64 ~arm"
IUSE=""

src_install() {
	dobin "${BUILD_DIR}"/sqfvm
	dolib.so "${BUILD_DIR}"/libsqfvm.so
}

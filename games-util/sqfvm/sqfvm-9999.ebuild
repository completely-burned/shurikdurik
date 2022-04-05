# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="7"

inherit cmake-utils git-r3

DESCRIPTION="Custom implementation of the Arma script language SQF"
HOMEPAGE="https://github.com/SQFvm/runtime"

EGIT_SUBMODULES=( '*' )
EGIT_REPO_URI="https://github.com/SQFvm/runtime.git"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_install() {
	dobin "${BUILD_DIR}"/sqfvm
	dolib.so "${BUILD_DIR}"/libsqfvm.so
}


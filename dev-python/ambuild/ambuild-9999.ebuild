# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_1,3_2,3_3,3_4} )

inherit distutils-r1 git-r3

EGIT_REPO_URI="git://github.com/alliedmodders/ambuild.git"

DESCRIPTION="AMBuild"
HOMEPAGE="https://wiki.alliedmods.net/AMBuild"
SRC_URI=""

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"


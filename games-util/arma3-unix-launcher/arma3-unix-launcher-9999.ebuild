# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit git-r3 cmake-utils

DESCRIPTION="ArmA 3 Unix Launcher"
HOMEPAGE="https://github.com/muttleyxd/arma3-unix-launcher"
EGIT_REPO_URI="git://github.com/muttleyxd/arma3-unix-launcher.git"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-cpp/gtkmm:3.0"

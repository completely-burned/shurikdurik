# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

DESCRIPTION="Necesse Dedicated server"
HOMEPAGE="https://necessewiki.com/Multiplayer"

MY_PV="${PV//./-}"
MY_P="${PN}-linux64-${MY_PV}.zip"
SRC_URI="
	http://necessegame.com/content/server/${MY_PV}/${MY_P}
"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+system-java"
RESTRICT="mirror strip"

# I use the /opt/steamcmd path for easier file deduplication.
RDEPEND="
	acct-group/steamcmd
	acct-user/steamcmd
	system-java? ( virtual/jre )
"

# There should be S="${WORKDIR}/*/" really.
S=${WORKDIR}

MY_INTO="/opt/steamcmd/${PN}"
src_install() {
	diropts -o steamcmd -g steamcmd
	dodir ${MY_INTO}

	if use system-java
	then
		rm -r */jre
		#rm -r */lib
		rm */StartServer*.sh
	else
		exeopts -o steamcmd -g steamcmd
		exeinto ${MY_INTO}
		doexe */StartServer-nogui.sh
		rm */StartServer-nogui.sh
	fi

	insinto ${MY_INTO}
	doins -r */*

	systemd_dounit "${FILESDIR}"/${PN}.service
}

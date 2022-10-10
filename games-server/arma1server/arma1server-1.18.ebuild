# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
inherit systemd

DESCRIPTION="ArmA: Armed Assault - Linux Server"
HOMEPAGE="http://community.bistudio.com/wiki/ArmA:_Dedicated_Server"
SRC_URI="http://www.armedassault.com/downloads/${P}.tar.bz2"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror strip"

RDEPEND="
	acct-group/steamcmd
	acct-user/steamcmd
	sys-libs/glibc
	sys-libs/zlib
	amd64? (
		|| ( app-emulation/emul-linux-x86-baselibs sys-libs/zlib[abi_x86_32] )
		sys-libs/glibc[multilib]
	)
"

QA_PREBUILT="
	opt/steamcmd/${PN}/server
	opt/steamcmd/${PN}/libsteam_api.so
	opt/steamcmd/${PN}/steamclient.so
	opt/steamcmd/${PN}/battleye/beserver.so
"

S=${WORKDIR}

src_prepare() {
	rm -f tolower.c install
	eapply_user
}

src_install() {
	diropts -o steamcmd -g steamcmd
	dodir /opt/steamcmd/${PN}

	exeopts -o steamcmd -g steamcmd
	exeinto /opt/steamcmd/${PN}
	doexe server
	rm server

	insinto /opt/steamcmd/${PN}
	doins -r *

	newconfd "${FILESDIR}"/${PN}.confd ${PN}
	systemd_dounit "${FILESDIR}"/${PN}.service
}

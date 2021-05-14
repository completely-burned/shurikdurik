# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
inherit systemd unpacker

DESCRIPTION="Battlefield 2 Dedicated Linux Server"
HOMEPAGE="http://battlefield.ea.com/battlefield/bf2/"

SRC_URI="
	!gzip? ( ftp://donik.org/pub/games/BF2/server/${P}-installer.sh )
	gzip? ( ftp://ftp.bf-games.net/server-files/bf2/${P}-installer.tgz )
"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gzip"
RESTRICT="mirror strip"

RDEPEND="
	acct-group/bf2-linuxded
	acct-user/bf2-linuxded
	sys-libs/glibc
	sys-libs/ncurses
	sys-libs/zlib
"

QA_PREBUILT="
	/opt/${PN}/bin/amd-64/bf2
	/opt/${PN}/bin/ia-32/bf2
	/opt/${PN}/bin/amd-64/pbsvnew.so
	/opt/${PN}/bin/ia-32/pbsvnew.so
"

S=${WORKDIR}

src_unpack() {
	if use gzip ; then
		unpack ${A}
		unpack_makeself ${P}-installer.sh
		rm ${P}-installer.sh
	else
		unpack_makeself ${A}
	fi
}

src_prepare() {
	if use amd64 ; then
		rm -fR bin/ia-32 pb_ia-32
	else
		rm -fR bin/amd-64 pb_amd-64
	fi
	eapply_user
}

src_install() {
	diropts -o bf2-linuxded -g bf2-linuxded

	doenvd ${FILESDIR}/99-bf2-linuxded

	insinto /opt/${PN}
	doins -r *

	if use amd64 ; then
		fperms +x /opt/${PN}/bin/amd-64/bf2
		systemd_newunit "${FILESDIR}"/${PN}-amd64.service ${PN}.service
		dosym pb_amd-64 /opt/${PN}/pb
	else
		fperms +x /opt/${PN}/bin/ia-32/bf2
		systemd_newunit "${FILESDIR}"/${PN}-x86.service ${PN}.service
		dosym pb_ia-32 /opt/${PN}/pb
	fi

	newconfd "${FILESDIR}"/${PN}.conf.d ${PN}

}

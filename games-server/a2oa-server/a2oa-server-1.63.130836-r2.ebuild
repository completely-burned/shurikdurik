# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
inherit systemd


DESCRIPTION="ARMA 2 OA - Linux Server"
HOMEPAGE="http://community.bistudio.com/wiki/ArmA:_Dedicated_Server"

PATCH_P="${P}.tar.bz2"
SRC_URI="
	https://www.dropbox.com/s/ocq6m3afsi7oc34/${PATCH_P}
	https://dl.dropbox.com/u/18463425/a2oa/${PATCH_P}
	https://www.arma2.com/downloads/update/${PATCH_P}
	https://downloads.bistudio.com/arma2.com/update/${PATCH_P}
	ftp://downloads.bistudio.com/arma2.com/update/${PATCH_P}
	https://www.dropbox.com/s/1by4asvkbx1ejxp/${PATCH_P}
	https://ipfs.io/ipfs/QmSmxUPL97ebREZ4iSx29kxv1jv7ShDjfWaCQWj4iyS3qg?filename=${PATCH_P} -> ${PATCH_P}
"

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

src_install() {
	diropts -o steamcmd -g steamcmd
	dodir /opt/steamcmd/${PN}

	exeopts -o steamcmd -g steamcmd
	exeinto /opt/steamcmd/${PN}
	doexe server

	rm server
	insinto /opt/steamcmd/${PN}
	doins -r *

	systemd_newunit "${FILESDIR}"/${PN}.service-r1 ${PN}.service
}

pkg_postinst() {
	ewarn "Update BattlEye"
	ewarn "wget https://www.battleye.com/downloads/arma2oa/beserver.so -O /opt/steamcmd/${PN}/expansion/battleye/beserver.so"
}


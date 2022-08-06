# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
inherit systemd


DESCRIPTION="ARMA 2 OA - Linux Server"
HOMEPAGE="http://community.bistudio.com/wiki/ArmA:_Dedicated_Server"

PATCH_P="${P}.tar.bz2"
SRC_URI="
	http://localhost:8080/ipfs/QmSmxUPL97ebREZ4iSx29kxv1jv7ShDjfWaCQWj4iyS3qg -> ${PATCH_P}
	http://dl.dropbox.com/u/18463425/a2oa/${PATCH_P}
	http://www.arma2.com/downloads/update/${PATCH_P}
	http://downloads.bistudio.com/arma2.com/update/${PATCH_P}
	ftp://downloads.bistudio.com/arma2.com/update/${PATCH_P}
	http://www.dropbox.com/s/1by4asvkbx1ejxp/${PATCH_P}
	http://www.dropbox.com/s/ocq6m3afsi7oc34/${PATCH_P}
"

SLOT="1.63"
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
PATCH_PN="${PN}-${SLOT}"

QA_PREBUILT="
	opt/steamcmd/${PATCH_PN}/server
	opt/steamcmd/${PATCH_PN}/libsteam_api.so
	opt/steamcmd/${PATCH_PN}/steamclient.so
	opt/steamcmd/${PATCH_PN}/battleye/beserver.so
"

S=${WORKDIR}

src_install() {
	diropts -o steamcmd -g steamcmd
	dodir /opt/steamcmd/${PATCH_PN}

	exeopts -o steamcmd -g steamcmd
	exeinto /opt/steamcmd/${PATCH_PN}
	doexe server

	rm server
	insinto /opt/steamcmd/${PATCH_PN}
	doins -r *

	systemd_newunit "${FILESDIR}"/${PATCH_PN}.service ${PATCH_PN}.service
}

pkg_postinst() {
	ewarn "Update BattlEye"
	ewarn "wget https://www.battleye.com/downloads/arma2oa/beserver.so -O /opt/steamcmd/${PN}/expansion/battleye/beserver.so"
}


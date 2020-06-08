# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit games systemd

PATCH_P="${P}.tar.bz2"
DESCRIPTION="ARMA 2 OA - Linux Server"
HOMEPAGE="http://community.bistudio.com/wiki/ArmA:_Dedicated_Server"
SRC_URI="
	http://dl.dropbox.com/u/18463425/a2oa/${PATCH_P}
	http://www.arma2.com/downloads/update/${PATCH_P}
	http://downloads.bistudio.com/arma2.com/update/${PATCH_P}
	ftp://downloads.bistudio.com/arma2.com/update/${PATCH_P}
	https://www.dropbox.com/s/1by4asvkbx1ejxp/${PATCH_P}
"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror strip"

RDEPEND="
	sys-libs/glibc
	sys-libs/zlib
	amd64? (
		|| ( app-emulation/emul-linux-x86-baselibs sys-libs/zlib[abi_x86_32] )
		sys-libs/glibc[multilib]
	)
"

GAMES_USER_DED=arma2
dir=${GAMES_PREFIX_OPT}/${PN}
QA_PREBUILT="${dir}"/server

S=${WORKDIR}

src_prepare() {
	rm -f tolower.c install
}

src_install() {
	insinto "${dir}"
	doins -r *
	fperms +x "${dir}"/server

	doins -r "${FILESDIR}"/${PN}-tolower.sh
	fperms +x "${dir}"/${PN}-tolower.sh

	systemd_dounit "${FILESDIR}"/${PN}.service

	prepgamesdirs

	fowners -R ${GAMES_USER_DED} "${dir}"
}

pkg_postinst() {
	ewarn "Update BattlEye"
	ewarn "wget https://www.battleye.com/downloads/arma2oa/beserver.so -O ${dir}/expansion/battleye/beserver.so"
}


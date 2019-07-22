# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit games systemd

DESCRIPTION="ArmA: Armed Assault - Linux Server"
HOMEPAGE="http://community.bistudio.com/wiki/ArmA:_Dedicated_Server"
SRC_URI="http://www.armedassault.com/downloads/${P}.tar.bz2"

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

GAMES_USER_DED=arma
dir=${GAMES_PREFIX_OPT}/${PN}
QA_PREBUILT="${dir}"/armaserver

S=${WORKDIR}

src_prepare() {
	mv armaserver armaserver-daemon-bad.txt
	mv server armaserver
	rm -f tolower.c install
}

src_install() {
	insinto "${dir}"
	doins -r * || die "doins failed"
	fperms +x "${dir}"/armaserver || die "fperms failed"

	newconfd "${FILESDIR}"/${PN}.confd ${PN}
	systemd_dounit "${FILESDIR}"/${PN}.service

	prepgamesdirs

        fowners -R ${GAMES_USER_DED} "${dir}"
}

# pkg_postinst() {
	# ewarn "Update BattlEye"
	# ewarn "wget https://www.battleye.com/downloads/arma2oa/beserver.so -O ${dir}/expansion/battleye/beserver.so"
# }


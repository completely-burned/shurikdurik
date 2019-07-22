# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit games systemd unpacker

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

RDEPEND="sys-libs/glibc
	sys-libs/ncurses
	sys-libs/zlib"

GAMES_USER_DED=bf2
dir=${GAMES_PREFIX_OPT}/${PN}
QA_PREBUILT='"${dir}"/bin/amd-64/bf2 "${dir}"/bin/ia-32/bf2'

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
}

src_install() {
	doenvd ${FILESDIR}/99-bf2-linuxded

	insinto "${dir}"
	doins -r * || die "doins failed"

	if use amd64 ; then
		fperms +x "${dir}"/bin/amd-64/bf2 || die "fperms failed"
		systemd_newunit "${FILESDIR}"/${PN}-amd64.service ${PN}.service
		dosym pb_amd-64 "${dir}"/pb
	else
		fperms +x "${dir}"/bin/ia-32/bf2 || die "fperms failed"
		systemd_newunit "${FILESDIR}"/${PN}-x86.service ${PN}.service
		dosym pb_ia-32 "${dir}"/pb
	fi
	newconfd "${FILESDIR}"/${PN}.conf.d ${PN}

	prepgamesdirs

	fowners -R ${GAMES_USER_DED} "${dir}"
}

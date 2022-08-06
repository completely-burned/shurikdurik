# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
DESCRIPTION="DePbo tools for Linux consists of a shared library and a set of command line tools"
HOMEPAGE="https://community.bistudio.com/wiki/Mikero_Tools"

P_FILE="depbotools-${PV}-linux-amd64.tgz"
SRC_URI="https://mikero.bytex.digital/api/download?filename=${P_FILE} -> ${P_FILE}"
KEYWORDS="amd64"
SLOT="0"

RDEPEND="
	dev-libs/lzo
	media-libs/libvorbis
	media-libs/libogg
"

S="${WORKDIR}/depbo-${PV}"

src_install() {
	dodoc -r doc/* *.txt
	into /opt/depbo-tools/
	dobin bin/*
	dolib.so lib/*
	doenvd ${FILESDIR}/99-depbo-tools
}


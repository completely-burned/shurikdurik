# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
DESCRIPTION="DePbo tools for Linux consists of a shared library and a set of command line tools"
HOMEPAGE="https://community.bistudio.com/wiki/Mikero_Tools"

P_FILE="${P}-linux-amd64.tgz"
SRC_URI="
	https://ipfs.io/ipfs/QmVUYqimWCTSAdFY31G3kLGPiuwv67iWMsK33qJiyNAm9D -> ${P_FILE}
	http://127.0.0.1:8080/ipfs/QmVUYqimWCTSAdFY31G3kLGPiuwv67iWMsK33qJiyNAm9D -> ${P_FILE}
	http://mikero.bytex.digital/api/download?filename=${P_FILE} -> ${P_FILE}
"
RESTRICT="mirror bindist"
KEYWORDS="~amd64"
SLOT="0"

RDEPEND="
	dev-libs/lzo
	media-libs/libvorbis
	media-libs/libogg
"

src_install() {
	dodoc -r doc/* *.txt
	into /opt/${PN}
	dobin bin/*
	dolib.so lib/*
	doenvd ${FILESDIR}/99-${PN}
}

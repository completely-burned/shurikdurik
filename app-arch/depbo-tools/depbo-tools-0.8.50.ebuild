# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
DESCRIPTION="DePbo tools for Linux consists of a shared library and a set of command line tools"
HOMEPAGE="https://community.bistudio.com/wiki/Mikero_Tools"
SRC_URI="https://armaservices.maverick-applications.com/Products/MikerosDosTools/DownloadFree.aspx?download=${P}-linux-64bit.tgz -> ${P}-linux-64bit.tgz"
KEYWORDS="amd64"
SLOT="0"

RDEPEND="
	dev-libs/lzo
	media-libs/libvorbis
	media-libs/libogg
"

src_install() {
	dodoc -r doc/* *.txt
	into /opt/depbo-tools/
	dobin bin/*
	dolib.so lib/*
	doenvd ${FILESDIR}/99-depbo-tools
}


# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit cmake-utils

DESCRIPTION="Monero AMD (OpenCL) miner"
HOMEPAGE="https://github.com/xmrig/xmrig-amd"
V="2.4.3-beta2"
SRC_URI="https://github.com/xmrig/${PN}/archive/v${V}.tar.gz -> ${P}.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

DEPEND="
	net-libs/libmicrohttpd
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-${V}"

src_install() {
	dobin "${WORKDIR}"/"${P}_build"/xmrig-amd
}

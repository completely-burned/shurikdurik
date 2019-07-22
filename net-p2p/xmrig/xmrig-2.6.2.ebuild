# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit cmake-utils

DESCRIPTION="Monero (XMR) CPU miner"
HOMEPAGE="https://github.com/xmrig/xmrig"
SRC_URI="https://github.com/xmrig/${PN}/archive/v${PV}.tar.gz -> xmrig-v${PV}.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""

DEPEND="
	net-libs/libmicrohttpd
"
RDEPEND="${DEPEND}"

src_install() {
	dobin "${WORKDIR}"/"${P}_build"/xmrig
}

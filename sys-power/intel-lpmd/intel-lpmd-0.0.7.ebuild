# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd autotools

DESCRIPTION="Intel Low Power Mode Daemon"
HOMEPAGE="https://github.com/intel/intel-lpmd"
SRC_URI="https://github.com/intel/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
"

src_prepare() {
	default
	eautoreconf
}

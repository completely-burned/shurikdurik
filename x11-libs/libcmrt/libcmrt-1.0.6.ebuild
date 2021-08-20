# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="cmrt"

if [[ ${PV} = *9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/intel/${MY_PN}"
else
	SRC_URI="https://github.com/intel/${MY_PN}/archive/refs/tags/${PV}.tar.gz"
	S="${WORKDIR}/${MY_PN}-${PV}"
	KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
fi

inherit autotools multilib-minimal

DESCRIPTION="Intel C for Media RunTime GPU kernel manager"
HOMEPAGE="https://github.com/intel/${MY_PN}"
LICENSE="MIT"

SLOT="0"
IUSE=""
RESTRICT="test" # No tests

RDEPEND="
	>=x11-libs/libdrm-2.4.23[video_cards_intel,${MULTILIB_USEDEP}]
	>=x11-libs/libva-1.2.0:=[drm,${MULTILIB_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	eapply_user
	eautoreconf
}

multilib_src_configure() {
	ECONF_SOURCE="${S}" econf "${myconf[@]}"
}

multilib_src_install_all() {
	find "${D}" -name "*.la" -delete || die
}


# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot
# needed llhttp multilib?
#inherit cmake-multilib vcs-snapshot

DESCRIPTION="Cross-platform, efficient, customizable, and robust asynchronous HTTP/WebSocket server C++14 library"
HOMEPAGE="https://github.com/Stiffstream/restinio"
SRC_URI="https://github.com/Stiffstream/restinio/archive/refs/tags/v.${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

DEPEND="
	dev-cpp/expected-lite
	dev-libs/boost
	dev-libs/libfmt
	net-libs/http-parser
	net-libs/llhttp
"
# needed soname
#dev-cpp/sobjectizer

RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_USE_DIR="${S}"/dev
CMAKE_BUILD_TYPE=Release

src_configure() {
    #RESTINIO_BENCH
    #RESTINIO_FIND_DEPS
    #RESTINIO_INSTALL_BENCHES
    #RESTINIO_INSTALL_SAMPLES
    #RESTINIO_USE_BOOST_ASIO

	local mycmakeargs=(
		-DRESTINIO_TEST=OFF
		-DRESTINIO_SAMPLE=OFF
		-DRESTINIO_INSTALL_SAMPLES=OFF
		-DRESTINIO_BENCH=OFF
		-DRESTINIO_INSTALL_BENCHES=OFF
		-DRESTINIO_FIND_DEPS=ON
		-DRESTINIO_USE_BOOST_ASIO=shared
		-DRESTINIO_DEP_LLHTTP=system
		-DRESTINIO_DEP_FMT=system
		-DRESTINIO_DEP_EXPECTED_LITE=system
		-DRESTINIO_DEP_CATCH2=system
		-DRESTINIO_WITH_SOBJECTIZER=OFF
		-DRESTINIO_DEP_SOBJECTIZER=local
		-Wno-dev
	)
	cmake_src_configure
}

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake systemd

DESCRIPTION="A lightweight C++17 Distributed Hash Table implementation"
HOMEPAGE="https://github.com/savoirfairelinux/opendht/"
SRC_URI="https://github.com/savoirfairelinux/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="python tools proxy-server proxy-client systemd -doc"

DEPEND="
	>=dev-cpp/msgpack-cxx-1.3
	net-libs/gnutls
	dev-libs/nettle
	app-crypt/argon2
	sys-libs/readline
	dev-python/cython
	>=dev-libs/jsoncpp-1.7.4
	dev-cpp/asio
	dev-cpp/restinio
	net-libs/llhttp
	systemd? ( acct-user/opendht )
"
RDEPEND="${DEPEND}"

REQUIRED_USE="systemd? ( tools )"

CMAKE_BUILD_TYPE=Release

src_configure() {
	local mycmakeargs=(
		-DOPENDHT_PYTHON=$(usex python)
		-DOPENDHT_TOOLS=$(usex tools)
		-DOPENDHT_PROXY_SERVER=$(usex proxy-server)
		-DOPENDHT_PROXY_SERVER_IDENTITY=$(usex proxy-server)
		-DOPENDHT_PUSH_NOTIFICATIONS=$(usex proxy-server)
		-DOPENDHT_PROXY_CLIENT=$(usex proxy-client)
		-DOPENDHT_SYSTEMD=$(usex systemd)
		-DOPENDHT_DOCUMENTATION=$(usex doc)
		-DLLHTTP_LIBRARY=/usr/$(get_libdir)/libllhttp.so
		-DOPENDHT_IO_URING=On
		-DOPENDHT_INDEX=On
	)
	cmake_src_configure
}

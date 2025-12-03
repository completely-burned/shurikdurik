# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="8"

inherit cmake

DESCRIPTION="Qt based GUI tool designed to create and edit .torrent files"
HOMEPAGE="https://github.com/torrent-file-editor/torrent-file-editor"
LICENSE="GPL-3"

SRC_URI="http://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
IUSE="qt6 qt5 qt4"
REQUIRED_USE="^^ ( qt6 qt5 qt4 )"

CMAKE_BUILD_TYPE=Release

src_configure() {
	if use qt4; then
		local mycmakeargs=(
			-DQT4_BUILD=ON
		)
	fi
	if use qt5; then
		local mycmakeargs=(
			-DQT5_BUILD=ON
		)
	fi
	if use qt6; then
		local mycmakeargs=(
			-DQT6_BUILD=ON
		)
	fi
	cmake_src_configure
}

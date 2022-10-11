# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="8"

inherit git-r3 cmake

DESCRIPTION="ArmA 3 Unix Launcher"
HOMEPAGE="https://github.com/muttleyxd/arma3-unix-launcher"
LICENSE="MIT"

EGIT_REPO_URI="https://github.com/muttleyxd/arma3-unix-launcher.git"
if [[ "${PV}" != "9999" ]]
then
	MY_PV="${PV/0_alpha/commit-}"
	EGIT_COMMIT="${MY_PV}"
fi

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dayz"

# TODO: curlpp
# TODO: DEPEND GUI
DEPEND="
	dev-cpp/gtkmm:3.0
	dev-cpp/argparse
	dev-libs/pugixml
	dev-libs/spdlog
	dev-cpp/nlohmann_json
	>=dev-libs/libfmt-8.0.0
"

src_prepare() {
	sed -i -e "s:<argparse.hpp>:<argparse\/argparse.hpp>:" \
	"${S}/cmake/external_dependencies.cmake" || die "sed cmake/external_dependencies.cmake include argparse.hpp failed"
	sed -i -e "s:<argparse.hpp>:<argparse\/argparse.hpp>:" \
	"${S}/src/arma3-unix-launcher/main.cpp" || die "sed src/arma3-unix-launcher/main.cpp include argparse.hpp failed"
	sed -i -e "s:<argparse.hpp>:<argparse\/argparse.hpp>:" \
	"${S}/src/dayz-linux-launcher/main.cpp" || die "sed src/dayz-linux-launcher/main.cpp include argparse.hpp failed"

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_DAYZ_LAUNCHER=$(usex dayz)
	)
	cmake_src_configure
}

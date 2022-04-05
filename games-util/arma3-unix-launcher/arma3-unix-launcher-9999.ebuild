# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="7"

inherit git-r3 cmake

DESCRIPTION="ArmA 3 Unix Launcher"
HOMEPAGE="https://github.com/muttleyxd/arma3-unix-launcher"

EGIT_REPO_URI="https://github.com/muttleyxd/arma3-unix-launcher.git"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# TODO: curlpp
# TODO: DEPEND GUI
DEPEND="
	dev-cpp/gtkmm:3.0
	dev-cpp/argparse
	dev-libs/pugixml
	dev-libs/spdlog
	dev-cpp/nlohmann_json
"

src_prepare() {
	default
	cmake_src_prepare

	sed -i -e "s:#include\ <argparse.hpp>:#include\ <argparse\/argparse.hpp>:" \
	"${S}/cmake/external_dependencies.cmake" || die "sed cmake/external_dependencies.cmake include argparse.hpp failed"
	sed -i -e "s:#include\ <argparse.hpp>:#include\ <argparse\/argparse.hpp>:" \
	"${S}/src/arma3-unix-launcher/main.cpp" || die "sed src/arma3-unix-launcher/main.cpp include argparse.hpp failed"
}


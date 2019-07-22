# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils cmake-utils git-r3

DESCRIPTION="Ethereum miner with CUDA and stratum support"
HOMEPAGE="https://github.com/ethereum-mining/ethminer"
EGIT_REPO_URI="https://github.com/ethereum-mining/${PN}.git"
EGIT_SUBMODULES=( "*" )

if [[ ${PV} == 9999 ]]; then
	KEYWORDS=""
else
	MY_PV="${PV/_pre/.dev}"
	MY_PV="${MY_PV/_rc/rc}"
        MY_PV="${MY_PV/_alpha/-alpha.}"
	EGIT_COMMIT="v${MY_PV}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3+ LGPL-3+"
SLOT="0"
IUSE="apicore cuda dbus debug +opencl"

RDEPEND="
	cuda? ( dev-util/nvidia-cuda-toolkit )
	dbus? ( sys-apps/dbus )
	opencl? ( virtual/opencl )
"
DEPEND="${RDEPEND}
	dbus? ( virtual/pkgconfig )
"

CMAKE_MIN_VERSION="3.5"

src_configure() {
	local mycmakeargs=(
		-DAPICORE=$(usex apicore)
		-DCMAKE_BUILD_TYPE=$(usex debug "Debug" "Release")
		-DETHASHCL=$(usex opencl)
		-DETHASHCUDA=$(usex cuda)
		-DETHDBUS=$(usex dbus)
	)

	cmake-utils_src_configure
}

EAPI=7
inherit cmake git-r3

DESCRIPTION="Open-source xray engine"
HOMEPAGE="https://github.com/OpenXRay"
LICENSE="BSD"

MY_PN="xray-16"
MY_TAG="1144-december-2021-rc1"
MY_P="${MY_PN}-${MY_TAG}"

RESTRICT="mirror strip"
EGIT_REPO_URI="https://github.com/OpenXRay/xray-16.git"
EGIT_BRANCH="dev"
EGIT_SUBMODULES=( '*' )
EGIT_COMMIT="${MY_TAG}"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"
IUSE=""
DEPEND="
		media-libs/glew
		media-libs/freeimage
		net-libs/liblockfile
		media-libs/openal
		dev-cpp/tbb
		dev-libs/crypto++
		media-libs/libtheora
		media-libs/libogg
		media-libs/libvorbis
		media-libs/libsdl2
		dev-libs/lzo
		media-libs/libjpeg-turbo
		sys-libs/readline
		dev-libs/libpcre2
		dev-libs/libpcre
		app-arch/lzop
		dev-vcs/git
		media-libs/libglvnd
		dev-util/cmake
"
RDEPEND=${DEPEND}

S=${WORKDIR}/${PN}-${PV}

src_configure() {

	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=Release
	)

	cmake_src_configure
}

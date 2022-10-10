EAPI=7
inherit git-r3

DESCRIPTION="Open-source xray engine"
HOMEPAGE="https://github.com/OpenXRay"
LICENSE="BSD"

EGIT_REPO_URI="https://github.com/OpenXRay/xray-16.git"
EGIT_BRANCH="dev"
SRC_URI=""

SLOT="0"
KEYWORDS="~amd64"
IUSE="clang debug"
RESTRICT=""
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
		
		!clang? (
			>sys-devel/gcc-7.5.0
		)

		clang? (
				sys-devel/clang
		)
"
RDEPEND=${DEPEND}

S=${WORKDIR}/${PN}-${PV}

src_configure() {
	mkdir ${S}/bin
	cd ${S}/bin
	if use debug && use clang; then
		CC=clang CXX=clang++ cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_BINDIR=/usr/bin
	elif use clang; then
		CC=clang CXX=clang++ cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_BINDIR=/usr/bin
	elif use debug; then
		cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_BINDIR=/usr/bin
	else
		cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_BINDIR=/usr/bin
	fi
}

src_compile() {
	cd ${S}/bin
	emake
}

src_install() {
	cd ${S}/bin
	emake DESTDIR="${D}" install
}

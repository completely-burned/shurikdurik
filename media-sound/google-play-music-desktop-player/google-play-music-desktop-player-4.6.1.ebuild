# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# media-sound/google-play-music-desktop-player

EAPI=7

inherit unpacker

MY_PN="Google-Play-Music-Desktop-Player-UNOFFICIAL-"

DESCRIPTION="A beautiful cross platform Desktop Player for Google Play Music"
HOMEPAGE="https://www.googleplaymusicdesktopplayer.com/"
SRC_URI="https://github.com/MarshallOfSound/${MY_PN}/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="system-ffmpeg system-electron"

BDEPEND=">=net-libs/nodejs-6.3.0[npm]
	net-dns/avahi[mdnsresponder-compat]
	sys-apps/fakeroot"

RDEPEND="net-dns/avahi[mdnsresponder-compat]
	system-ffmpeg? ( media-video/ffmpeg[chromium] )
	system-electron? ( dev-util/electron )"

S="${WORKDIR}/${MY_PN}-${PV}"

src_compile() {
	npm install

	npm run build

	if use amd64; then
		npm run make:deb:64
		MY_DEB="${S}/dist/installers/debian/${PN}_${PV}_amd64.deb"
	fi

	if use x86; then
		npm run make:deb:32
		MY_DEB="${S}/dist/installers/debian/${PN}_${PV}_i386.deb"
	fi

	mkdir ${S}/unpack_image/
	cd ${S}/unpack_image/

	unpack_deb ${MY_DEB}

	rm ${MY_DEB}

	if use system-electron; then
		rm usr/share/${PN}/libnode.so
	fi

	if use system-ffmpeg; then
		rm usr/share/${PN}/libffmpeg.so
	fi
}

src_install() {
	cd ${S}/unpack_image/

	dodoc -r usr/share/doc/*

	insinto /usr/share/${PN}/
	doins -r usr/share/${PN}/*

	insinto /usr/share/applications/
	doins -r usr/share/applications/*

	insinto /usr/share/lintian/
	doins -r usr/share/lintian/*

	insinto /usr/share/pixmaps/
	doins -r usr/share/pixmaps/*

	# into /usr/
	# newbin "usr/share/${PN}/Google Play Music Desktop Player" ${PN}
	dosym "/usr/share/${PN}/Google Play Music Desktop Player" /usr/bin/${PN}
	fperms +x "/usr/share/${PN}/Google Play Music Desktop Player"
}


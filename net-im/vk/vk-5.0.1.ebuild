EAPI=7

inherit unpacker desktop

DESCRIPTION="VK Messenger"
HOMEPAGE="https://vk.com/desktop_app"

PKGREL=1

SRC_URI="
	amd64? ( https://desktop.userapi.com/debian/pool/master/v/vk/${PN}_${PV}-${PKGREL}_amd64.deb )
	x86? ( https://desktop.userapi.com/debian/pool/master/v/vk/${PN}_${PV}-${PKGREL}_i386.deb )
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="system-ffmpeg system-electron"

RDEPEND="
	system-ffmpeg? ( media-video/ffmpeg[chromium] )
	system-electron? ( dev-util/electron )
"

S="${WORKDIR}"

dir=/opt/${PN}

src_unpack() {
	unpack_deb ${A}
}

src_prepare() {
	if use system-electron; then
		rm usr/lib/${PN}/libnode.so
	fi

	if use system-ffmpeg; then
		rm usr/lib/${PN}/libffmpeg.so
	fi

	rm usr/lib/${PN}/resources/app/dist/libGLESv2.so
	rm usr/lib/${PN}/resources/app/dist/libEGL.so

	eapply_user
}

src_install() {
	insinto ${dir}
	doins -r usr/lib/vk/*

	fperms +x ${dir}/vk

	dosym ${dir}/vk /opt/bin/vk

	dodoc -r usr/share/doc/*

	local res
	for res in 24 256; do
		newicon -s ${res} usr/lib/vk/icon${res}.png ${PN}.png
	done

	doicon usr/share/pixmaps/*

	domenu usr/share/applications/*

	insinto /usr/share/lintian/
	doins -r usr/share/lintian/*

}

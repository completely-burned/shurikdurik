# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker desktop xdg-utils

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
RESTRICT="mirror bindist"
IUSE=""

S="${WORKDIR}"

QA_PREBUILT="
	opt/${PN}/vk
	opt/${PN}/resources/app/dist/libEGL.so
	opt/${PN}/resources/app/dist/libGLESv2.so
	opt/${PN}/resources/app/dist/libppapi_voip_swiftshader_x86_64.so
	opt/${PN}/resources/app/dist/libppapi_voip_x86_64.so
	opt/${PN}/libffmpeg.so
	opt/${PN}/libnode.so

"

src_install() {
	insinto /opt/${PN}
	doins -r usr/lib/vk/*

	fperms +x /opt/${PN}/vk

	dosym /opt/${PN}/vk /opt/bin/vk

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

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
}

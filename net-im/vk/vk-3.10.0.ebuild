EAPI=6

inherit eutils unpacker

DESCRIPTION="VK Messenger"
HOMEPAGE="https://vk.com/desktop_app"

SRC_URI="amd64? ( https://desktop.userapi.com/debian/pool/master/v/vk/${PN}_${PV}-1_amd64.deb )
	x86? ( https://desktop.userapi.com/debian/pool/master/v/vk/${PN}_${PV}-1_i386.deb )"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}"
RESTRICT="mirror bindist strip"

RDEPEND=""

dir=/opt/"${PN}"
QA_PREBUILT=${dir}/vk

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	insinto ${dir}
	doins -r usr/lib/vk/*

	fperms +x ${dir}/vk

	dosym ${dir}/vk /opt/bin/vk

	local res
	for res in 24 256; do
		newicon -s ${res} usr/lib/vk/icon${res}.png ${PN}.png
	done

	doicon usr/share/pixmaps/vk.png

	domenu usr/share/applications/vk.desktop
}

EAPI="6"

inherit git-r3 

DESCRIPTION="This Vulkan layer can be used to do GPU offloading. Typically you want to display an image rendered on a more powerful GPU on a display managed by an internal GPU."
HOMEPAGE="https://github.com/felixdoerre/primus_vk"
EGIT_REPO_URI="https://github.com/felixdoerre/primus_vk.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-libs/vulkan-layers
	x11-misc/bumblebee
	x11-drivers/nvidia-drivers
	x11-misc/primus"

src_prepare() {
	if use amd64 ; then
		sed -i -e 's#/usr/lib/x86_64-linux-gnu/nvidia/current/libGL.so.1#/usr/lib64/opengl/nvidia/lib/libGL.so.1#g' nv_vulkan_wrapper.cpp
	else
		sed -i -e 's#/usr/lib/x86_64-linux-gnu/nvidia/current/libGL.so.1#/usr/lib/opengl/nvidia/lib/libGL.so.1#g' nv_vulkan_wrapper.cpp
	fi
	eapply_user
}

src_install() {
	dolib.so lib*.so

	insinto /etc/vulkan/icd.d
	newins ${FILESDIR}/nvidia_primus_vk_icd.json nvidia_icd.json

	insinto /usr/share/vulkan/implicit_layer.d
	doins primus_vk.json
}

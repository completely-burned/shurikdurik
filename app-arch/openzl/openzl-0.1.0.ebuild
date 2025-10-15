# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="OpenZL delivers high compression ratios while preserving high speed, a level of performance that is out of reach for generic compressors."
HOMEPAGE="https://openzl.org"
LICENSE="BSD"

RDEPEND="!app-arch/zstd"

inherit cmake git-r3
EGIT_SUBMODULES=( '*' )
EGIT_REPO_URI="https://github.com/facebook/${PN}.git"
if [[ ${PV} == 9999 ]]; then
	KEYWORDS=""
	PROPERTIES="live"
else
	EGIT_COMMIT="v${PV}"
	KEYWORDS="~amd64 ~x86 ~arm ~arm64"
fi

SLOT="0"

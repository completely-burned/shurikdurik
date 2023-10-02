# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{5..12} )

inherit distutils-r1 pypi

DESCRIPTION="Take control of Steam from your terminal"
HOMEPAGE="
	https://github.com/ValvePython/steamctl
	https://pypi.org/project/steamctl/
"
SRC_URI="
	$(pypi_sdist_url "${PN^}" "${PV}")
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc ~riscv"
RESTRICT="mirror"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/steam-1.4.3[${PYTHON_USEDEP}]
		dev-python/appdirs[${PYTHON_USEDEP}]
		dev-python/argcomplete[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-python/arrow[${PYTHON_USEDEP}]
		dev-python/qrcode[${PYTHON_USEDEP}]
		>=dev-python/vpk-1.3.2[${PYTHON_USEDEP}]
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/gevent[${PYTHON_USEDEP}]
	')
"

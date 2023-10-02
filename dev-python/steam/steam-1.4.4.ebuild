# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{4..12} pypy pypy3 )

inherit distutils-r1 pypi

DESCRIPTION="Python package for interacting with Steam"
HOMEPAGE="
	http://steam.readthedocs.io/
	https://github.com/ValvePython/steam/
	https://pypi.python.org/pypi/steam
"
SRC_URI="
	$(pypi_sdist_url "${PN^}" "${PV}")
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~x64-macos ~x64-solaris"
RESTRICT="mirror"

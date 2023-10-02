# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{4..12} pypy pypy3 )

inherit distutils-r1 pypi

DESCRIPTION="EventEmitter using gevent"
HOMEPAGE="
	https://github.com/rossengeorgiev/gevent-eventemitter
	https://pypi.org/project/gevent-eventemitter
"
SRC_URI="
	https://github.com/rossengeorgiev/gevent-eventemitter/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~x64-macos ~x64-solaris"
RESTRICT="mirror"

# TODO:
# gevent>=1.3
RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/gevent-1.3.0[${PYTHON_USEDEP}]
	')
"

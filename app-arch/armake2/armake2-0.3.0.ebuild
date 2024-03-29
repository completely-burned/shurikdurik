# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

CRATES="
	armake2@0.3.0
	aho-corasick@0.6.10
	ansi_term@0.11.0
	arrayvec@0.4.10
	atty@0.2.11
	autocfg@0.1.2
	bitflags@1.0.4
	byteorder@1.3.1
	cast@0.2.2
	cc@1.0.29
	cfg-if@0.1.6
	clap@2.32.0
	cloudabi@0.0.3
	colored@1.7.0
	criterion@0.2.10
	criterion-plot@0.3.0
	crossbeam-deque@0.2.0
	crossbeam-epoch@0.3.1
	crossbeam-utils@0.2.2
	csv@1.0.5
	csv-core@0.1.5
	docopt@1.0.2
	either@1.5.1
	foreign-types@0.3.2
	foreign-types-shared@0.1.1
	fuchsia-cprng@0.1.1
	itertools@0.8.0
	itoa@0.4.3
	lazy_static@1.2.0
	libc@0.2.49
	linked-hash-map@0.5.1
	memchr@2.2.0
	memoffset@0.2.1
	nodrop@0.1.13
	num-traits@0.2.6
	num_cpus@1.10.0
	openssl@0.10.18
	openssl-sys@0.9.41
	peg@0.5.7
	pkg-config@0.3.14
	proc-macro2@0.4.27
	quote@0.3.15
	quote@0.6.11
	rand@0.6.5
	rand_chacha@0.1.1
	rand_core@0.3.1
	rand_core@0.4.0
	rand_hc@0.1.0
	rand_isaac@0.1.1
	rand_jitter@0.1.3
	rand_os@0.1.2
	rand_pcg@0.1.2
	rand_xorshift@0.1.1
	rand_xoshiro@0.1.0
	rayon@1.0.3
	rayon-core@1.4.1
	rdrand@0.4.0
	redox_syscall@0.1.51
	redox_termios@0.1.1
	regex@1.1.0
	regex-syntax@0.6.5
	remove_dir_all@0.5.1
	ryu@0.2.7
	same-file@1.0.4
	scopeguard@0.3.3
	serde@1.0.88
	serde_derive@1.0.88
	serde_json@1.0.38
	strsim@0.7.0
	syn@0.15.26
	tempfile@3.0.7
	termion@1.5.1
	textwrap@0.10.0
	thread_local@0.3.6
	time@0.1.42
	tinytemplate@1.0.1
	ucd-util@0.1.3
	unicode-width@0.1.5
	unicode-xid@0.1.0
	utf8-ranges@1.0.2
	vcpkg@0.2.6
	walkdir@2.2.7
	winapi@0.3.6
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.2
	winapi-x86_64-pc-windows-gnu@0.4.0
	winreg@0.6.0
"

inherit cargo

DESCRIPTION="Arma 3 modding tools. Successor to armake written in Rust"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/KoffeinFlummi/armake2"
SRC_URI="${CARGO_CRATE_URIS}"

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/openssl"
RDEPEND="${DEPEND}"
BDEPEND=""

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"

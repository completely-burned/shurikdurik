# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="Group for OpenDHT node systemd service"

ACCT_USER_GROUPS=( "opendht" )
ACCT_USER_ID="-1"

acct-user_add_deps

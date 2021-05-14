# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="A user for the Battlefield 2 server"

ACCT_USER_GROUPS=( "bf2-linuxded" )
ACCT_USER_HOME="/opt/bf2-linuxded"
ACCT_USER_ID="-1"

acct-user_add_deps

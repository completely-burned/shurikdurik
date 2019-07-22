EAPI=5
inherit games

DESCRIPTION="Unreal Tournament 4 Pre Alpha Playable Build"
HOMEPAGE="http://www.unrealtournament.com/"
SRC_URI="https://s3.amazonaws.com/unrealtournament/UnrealTournament-Client-XAN-${PV}-Linux.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

dir=${GAMES_PREFIX_OPT}/${PN}
S=${WORKDIR}
QA_PREBUILT="${dir}/LinuxNoEditor/Engine/Binaries/Linux/CrashReportClient ${dir}/LinuxNoEditor/Engine/Binaries/Linux/UE4-Linux-Shipping ${dir}/LinuxNoEditor/Engine/Binaries/Linux/UE4-Linux-Test"

src_install() {
	#newicon "${S}"/UnrealTournament4.png UnrealTournament4.png
	insinto "${dir}"
	doins -r *
	fperms +x "${dir}"/LinuxNoEditor/Engine/Binaries/Linux/CrashReportClient
	fperms +x "${dir}"/LinuxNoEditor/Engine/Binaries/Linux/UE4-Linux-Shipping
        fperms +x "${dir}"/LinuxNoEditor/Engine/Binaries/Linux/UE4-Linux-Test

	make_wrapper UnrealTournament4 "./UE4-Linux-Shipping UnrealTournament" "${dir}"/LinuxNoEditor/Engine/Binaries/Linux
	make_desktop_entry UnrealTournament4 "Unreal Tournament 4"
}

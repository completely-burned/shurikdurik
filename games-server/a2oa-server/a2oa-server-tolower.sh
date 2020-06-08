#!/bin/bash

IFS=$'\n'



SERVERPATH=${SERVERPATH:-"/opt/steamcmd/a2oa-server/"}

#ARMA2STEAMPATH=${ARMA2STEAMPATH:-"/opt/steamcmd/Steam/steamapps/common/Arma 2"}
#ARMA2OASTEAMPATH=${ARMA2OASTEAMPATH:-"/opt/steamcmd/Steam/steamapps/common/Arma 2 Operation Arrowhead"}
ARMA2STEAMPATH=${ARMA2STEAMPATH:-"/opt/steamcmd/.steam/SteamApps/common/Arma 2"}
ARMA2OASTEAMPATH=${ARMA2OASTEAMPATH:-"/opt/steamcmd/.steam/SteamApps/common/Arma 2 Operation Arrowhead"}
#ARMA2STEAMPATH=/opt/steamcmd/.steam/steamcmd/arma2_files/
#ARMA2OASTEAMPATH=/opt/steamcmd/.steam/steamcmd/arma2oa_files/


### A2
cd "${ARMA2STEAMPATH}"

for DIR in $(find ./ -type d); do
	if [ ! -d "${SERVERPATH}/ca/${DIR,,}" ]; then
		mkdir -p "${SERVERPATH}/ca/${DIR,,}"
	fi
done

for FILE in $(find ./ -type f ! -path "./ACR/*" ! -path "./PMC/*" ! -path "./BAF/*" ! -path "./DLCsetup/*" ! -path "./DirectX/*" ! -path "./BEsetup/*" ! -path "./BattlEye/*" ! -path "./Expansion/BattlEye/*"); do

	if [ ! -f "${SERVERPATH}/ca/${FILE,,}" ] && [ ! -L "${SERVERPATH}/ca/${FILE,,}" ] ; then
		ln -snf "${ARMA2STEAMPATH}/${FILE}" "${SERVERPATH}/ca/${FILE,,}"
	fi
done


### A2OA
cd "${ARMA2OASTEAMPATH}"

for DIR in $(find ./ -type d); do
	if [ ! -d "${SERVERPATH}/${DIR,,}" ]; then
		mkdir -p "${SERVERPATH}/${DIR,,}"
	fi
done

for FILE in $(find ./ -type f ! -path "./_ACR/*" ! -path "./_PMC/*" ! -path "./_BAF/*" ! -path "./DLCsetup/*" ! -path "./DirectX/*" ! -path "./BEsetup/*" ! -path "./BattlEye/*" ! -path "./Expansion/BattlEye/*"); do

	if [ ! -f "${SERVERPATH}${FILE,,}" ] && [ ! -L "${SERVERPATH}/${FILE,,}" ] ; then
		ln -snf "${ARMA2OASTEAMPATH}/${FILE}" "${SERVERPATH}/${FILE,,}"
	fi
done


cd "${SERVERPATH}"

exit 0


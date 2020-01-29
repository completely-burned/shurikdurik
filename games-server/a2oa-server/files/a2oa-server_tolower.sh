#!/bin/bash

IFS=$'\n'



SERVERPATH=${SERVERPATH:-"/opt/a2oa-server/"}

ARMA2STEAMPATH=${ARMA2STEAMPATH:-"/media/s3/games/SteamLibraryProton/steamapps/common/Arma 2"}
ARMA2OASTEAMPATH=${ARMA2OASTEAMPATH:-"/media/s3/games/SteamLibraryProton/steamapps/common/Arma 2 Operation Arrowhead"}

### delete symlinks
#find "${SERVERPATH}" -type l -delete

### A2
cd "${ARMA2STEAMPATH}"

for DIR in $(find ./ -type d); do
	if [ ! -d "${SERVERPATH}/${DIR,,}" ]; then
		mkdir "${SERVERPATH}/${DIR,,}"
	fi
done

for FILE in $(find ./ -type f); do

	if [ ! -f "${SERVERPATH}/${FILE,,}" ] || [ -L "${SERVERPATH}/${FILE,,}" ] ; then
		ln -snf "${ARMA2STEAMPATH}/${FILE}" "${SERVERPATH}/${FILE,,}"
	fi
done

### A2OA
cd "${ARMA2OASTEAMPATH}"

for DIR in $(find ./ -type d); do
	if [ ! -d "${SERVERPATH}/${DIR,,}" ]; then
		mkdir "${SERVERPATH}/${DIR,,}"
	fi
done

for FILE in $(find ./ -type f ! -path "./ACR/*" ! -path "./PMC/*" ! -path "./BAF/*"); do

	if [ ! -f "${SERVERPATH}${FILE,,}" ] || [ -L "${SERVERPATH}/${FILE,,}" ] ; then
		ln -snf "${ARMA2OASTEAMPATH}/${FILE}" "${SERVERPATH}/${FILE,,}"
	fi
done


exit 0

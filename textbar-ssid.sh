#!/bin/zsh -f
# Purpose: 	Show the SSID (name of currently connected Wi-Fi network)
#			Intended to be used with TextBar - http://www.richsomerfield.com/apps/
#
# From:	Tj Luo.ma
# Mail:	luomat at gmail dot com
# Web: 	http://RhymesWithDiploma.com
# Date:	2015-04-18


if [ ! -x '/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport' ]
then
	echo "airport command not found"
	exit 0
fi

SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I 2>/dev/null \
		 | awk -F': ' '/ SSID/{print $NF}')

if [[ "$SSID" == "" ]]
then
	echo "! No SSID found !"
else
	echo "$SSID"
fi

exit 0
#
#EOF

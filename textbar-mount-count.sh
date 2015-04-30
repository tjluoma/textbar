#!/bin/zsh -f
# Purpose: Show the number of mounted devices
#
# From:	Tj Luo.ma
# Mail:	luomat at gmail dot com
# Web: 	http://RhymesWithDiploma.com
# Date:	2015-04-18

COUNT=`find /Volumes/* -maxdepth 0 -type d -print | wc -l | tr -dc '[0-9]'`

if [ "$COUNT" = "0" ]
then
	echo "No Mounts"
elif [ "$COUNT" = "1" ]
then
	echo "1 Mount"
else
	echo "$COUNT Mounts"
fi

exit 0
#
#EOF

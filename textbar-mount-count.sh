#!/bin/zsh -f
# Purpose: Show the number of mounted devices
#
# From:	Tj Luo.ma
# Mail:	luomat at gmail dot com
# Web: 	http://RhymesWithDiploma.com
# Date:	2015-04-18

COUNT=`/sbin/mount | /usr/bin/egrep -v '^(devfs|map) ' | /usr/bin/wc -l | /usr/bin/tr -dc '[0-9]'`

	# We don't want to count the boot drive, so subtract 1
COUNT=$(($COUNT - 1))

if [ "$COUNT" = "0" ]
then
	echo -n "No Mounts"
elif [ "$COUNT" = "1" ]
then
	echo -n "1 Mount"
else
	echo -n "$COUNT Mounts"
fi

exit 0
#
#EOF

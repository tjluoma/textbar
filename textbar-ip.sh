#!/bin/zsh -f
# Purpose:
#
# From:	Tj Luo.ma
# Mail:	luomat at gmail dot com
# Web: 	http://RhymesWithDiploma.com
# Date:	2015-04-18


IP=`curl -sfL 'http://ipinfo.io/ip'`

if [[ "$IP" == "" ]]
then
	echo "! No IP found !"
else
	echo "$IP"
fi

exit 0
#
#EOF

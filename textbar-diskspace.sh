#!/bin/zsh -f
# Purpose: Show diskspace in TextBar
#
# From:	Tj Luo.ma
# Mail:	luomat at gmail dot com
# Web: 	http://RhymesWithDiploma.com
# Date:	2015-04-18

# Get the 'human readable' base-10 size
# get the 4th field that starts with a number after a space
/bin/df -H '/' \
| /usr/bin/awk -F' ' '/ [0-9]/{print $4}'

exit 0
#
#EOF

#!/bin/zsh -f
# Purpose:
#
# From:	Tj Luo.ma
# Mail:	luomat at gmail dot com
# Web: 	http://RhymesWithDiploma.com
# Date:	2015-04-29

# Thanks to @darkuncle for the tip
# https://twitter.com/darkuncle/status/593513107940454400

/usr/bin/top -S -n0 -l1 \
| /usr/bin/awk -F' ' '/^Swap/{print $2}'

exit
#
#EOF

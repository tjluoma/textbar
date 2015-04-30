#!/bin/zsh -f
# Purpose: show the on-air status of Relay.fm
#
# From:	Tj Luo.ma
# Mail:	luomat at gmail dot com
# Web: 	http://RhymesWithDiploma.com
# Date:	2015-04-30

	# Check the 'live' web page and grab the <title> from the HTML
RELAY_STATUS=`curl -sfL 'http://www.relay.fm/live' \
	| fgrep -i '<title>' \
	| sed 's#<title>##g ; s#</title>##g'`

case "$RELAY_STATUS" in
	On-Air*)

			# Extract the show title minus the word “On-Air: ”
		SHOW_TITLE=`echo "$RELAY_STATUS" | sed 's#On-Air: ##g' `

			# If we don't get a show title for some reason, use something else
		[[ "$SHOW_TITLE" == "" ]] && SHOW_TITLE="Relay.fm is live"

			# Output the information to stdout
		echo "🎣 $SHOW_TITLE"
	;;

	*)
			# if we don't output anything, TextBar will show a . so
			# we might as well show that the script didn't fail
		echo '💤'
	;;

esac

exit 0

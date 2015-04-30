#!/bin/zsh -f
# Purpose:
#
# From:	Tj Luo.ma
# Mail:	luomat at gmail dot com
# Web: 	http://RhymesWithDiploma.com
# Date:	2015-04-30

NAME="$0:t:r"

OUTPUT=''

RELAY_STATUS=`curl -sfL 'http://www.relay.fm/live' |fgrep -i '<title>' | sed 's#<title>##g ; s#</title>##g'`

RELAY_PREVIOUS_FILE="$HOME/.$NAME.relay.is-relay-fm-live.txt"

case "$RELAY_STATUS" in
	On-Air*)

		SHOW_TITLE=`echo "$RELAY_STATUS" | sed 's#On-Air: ##g' `

		RELAY_CURRENT='live'

		OUTPUT="$SHOW_TITLE $OUTPUT"

		touch "$RELAY_PREVIOUS_FILE"

		RELAY_PREVIOUS=`tail -1 "$RELAY_PREVIOUS_FILE"`

		if [ "$RELAY_PREVIOUS" != "$RELAY_CURRENT" ]
		then

			echo -n "$RELAY_CURRENT" > "$RELAY_PREVIOUS_FILE"

			/usr/local/bin/growlnotify --sticky \
				--image "$HOME/Pictures/Logos/RelayFM/500x500.png" \
				--identifier "$NAME Relay" \
				--url "http://www.relay.fm/live" \
				--message "Click to listen on Relay.fm" \
				--title "SHOW_TITLE is live"

			# open -a VLC 'http://amp.relay.fm:8000/stream'
		fi
	;;

	*)
			echo -n 'off-air' > "$RELAY_PREVIOUS_FILE"
	;;

esac


##########################
#
# ATP
#
##########################

curl -sfL 'http://www.marco.org/atp-live.html' | fgrep -q 'Currently off the air.'

ATP_EXIT="$?"

if [ "$ATP_EXIT" = "0" ]
then
	# Off the air
	:
else
	OUTPUT="ATP $OUTPUT"
fi

##########################
#
# 5by5.tv
#
##########################

## DBH
#       <iframe width="950" height="535" src="http://www.metacdn.com/r/l/bdorsikwq/dbh/embed"
#
# curl -sfL 'http://5by5.tv/live' | egrep -qi 'http://www.metacdn.com/r/l/bdorsikwq/dbh/embed'

curl -sfL 'http://5by5.tv/live' | fgrep -q 'Previously Recorded'

FIVE_BY_FIVE_EXIT="$?"

if [ "$FIVE_BY_FIVE_EXIT" = "1" ]
then
	OUTPUT="5by5 $OUTPUT"
fi


##########################
#
# Send Output
#
##########################

if [ "$OUTPUT" = "" ]
then
	echo -n '💤'
else
	echo "🎤  $OUTPUT" | sed 's#* $##g'
fi

exit
#
#EOF

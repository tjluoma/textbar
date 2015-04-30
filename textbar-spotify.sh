#!/bin/zsh -f
# Show Spotify in TextBar, if playing
#
# From:	Timothy J. Luoma
# Mail:	luomat at gmail dot com
# Date:	2015-04-24

	# Is Spotify running?
/usr/bin/pgrep -x -q Spotify

if [ "$?" = "1" ]
then
			# Spotify is not running
			# but TextBar will show a '.' if we don't give it _something_
			# so either give it nothing or maybe a ♫
		echo ''
		exit 0
fi

# Spotify is running

# Don't Indent - BEGIN
/usr/bin/osascript <<EOT
if application "Spotify" is running then
	tell application "Spotify"
		if player state is playing then
			-- return "♫ " & (artist of current track as string) & " - " & (name of current track as string)
			return "♫ '" & (name of current track as string) & "' by " & (artist of current track as string)
		end if
	end tell
end if
EOT
# Don't Indent - END

exit
#
#EOF

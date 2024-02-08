#!/bin/sh

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cache=`ls $dir/cache`

if ! echo "$cache" | grep -q "status.txt"; then
	kill vlc >/dev/null 2>&1
	echo ""
fi

if echo "$cache" | grep -q "status.txt"; then
	text=`cat $dir/cache/status.txt`
	mpc -q pause
	cvlc "$dir/cache/toothless-ringtone.mp3" >/dev/null 2>&1 &
	echo "$text "
	sleep 4
	rm "$dir/cache/status.txt"
	sleep 2
	mpc -q play
fi

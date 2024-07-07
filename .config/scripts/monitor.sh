#!/usr/bin/bash

# Simple scripts to ease configuration of monitors

arg=$1
xrandr --auto 
monitors=$(xrandr --listmonitors | awk '{print $4}')
for i in $monitors
do
	if [[ $i == *"eDP"* ]]; then
		lap=$i
	elif [[ $i == *"HDMI"* ]]; then
		ext=$i
	fi
done
case $arg in
	1)
		xrandr --output "$ext" --primary --auto --right-of "$lap" --auto --scale 1.25x1.25
		;;
	2)
		xrandr --output "$lap" --off
		;;
	*)
		;;
esac

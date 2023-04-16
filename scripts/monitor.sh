#!/usr/bin/bash

# Simple scripts to ease configuration of monitors

arg=$1
monitors=$(xrandr --listmonitors | awk '{print $4}')
for i in $monitors
do
	if [[ $i == *"eDP"* ]]; then
		lap=$i
	elif [[ $i == *"HDMI"* ]]; then
		ext=$i
	fi
done
# Check if monitor is off then enable all and get name
if [[ -z "$lap" ]]; then
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

fi
case $arg in
	1)
		xrandr --output "$ext" --auto --above "$lap" --auto
		;;
	2)
		xrandr --output "$lap" --off
		;;
	*)
		;;
esac

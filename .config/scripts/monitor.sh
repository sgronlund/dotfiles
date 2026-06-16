#!/usr/bin/bash
# Simple scripts to ease configuration of monitors

arg=$1
monitors=($(xrandr | awk '/ connected/ {print $1}'))
for i in "${monitors[@]}"; do
    if [[ $i == *"eDP"* ]]; then
        lap=$i
    elif [[ $i == *"HDMI"* ]]; then
        ext=$i
    fi
done
case $arg in
1)
    if [[ -n "$ext" ]]; then
        xrandr --output "$ext" --primary --auto --right-of "$lap"
    else
        xrandr --output "$lap" --primary --auto
    fi
    xrandr --auto
    ;;
2)
    xrandr --output "$lap" --off
    ;;
3)
    xrandr --output "$ext" --scale 1 --same-as "$lap"
    ;;
*)
    ;;
esac
hsetroot -fill ~/Downloads/private/daniel-leone-v7daTKlZzaw-unsplash.jpg

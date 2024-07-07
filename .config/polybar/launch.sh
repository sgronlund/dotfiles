#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
#killall -q polybar

# Launch example bar
# echo "---" | tee -a /tmp/polybar1.log
# polybar example --config="$HOME/.config/polybar/config.ini" &
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example --config="$HOME/.config/polybar/config.ini" &
  done
else
  polybar --reload example &
fi

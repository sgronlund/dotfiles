#!/bin/bash
#
# Simple script which uses `playerctl` to fetch metadata about the player playing,


# Check if anything is playing
active=$(playerctl status -s)
max_length=35

if [[ $active == "Playing" ]] || [[ $active == "Paused" ]]; then
  
  artist=$(playerctl metadata artist)
  if [[ ${#artist} > 0 ]]; then     
    song=$(playerctl metadata title)
    if [[ ${#song} -gt $max_length ]]; then
      song="${song:0:$max_length}..."
    fi
    if [[ $artist  == "" ]]; then
      artist=$(playerctl metadata album)
    fi
    echo "$song - $artist"
  else
    all_info=$(playerctl metadata --format '{{ title }}')
    echo "$all_info" # hopefully catches all of the cases
  fi
else
  echo "" #couldn't find a paused or playing player 
fi

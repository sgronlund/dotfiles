#!/bin/bash
#
# Simple script which uses `playerctl` to fetch metadata about the player playing,


# Check if anything is playing
active=$(playerctl status -s)


if [[ $active == "Playing" ]] || [[ $active == "Paused" ]]; then
  artist=$(playerctl metadata artist )
  song=$(playerctl metadata title )
  
  # Handle long song names, maybe handle artist too?
  max_length=35
  if [[ ${#song} -gt $max_length ]]; then
    song="${song:0:$max_length}..."
  fi
   
  # no artist, podcast playing --> album is artist
  if [[ $artist  == "" ]]; then
    artist=$(playerctl metadata album )
  fi
  echo "$song - $artist"
else
  echo "" #couldn't find a paused or playing player 
fi

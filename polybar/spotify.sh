#!/bin/bash
#
# Simple script which uses `playerctl` to fetch metadata about the player playing,


# Check if anything is playing
active=$(playerctl status -s --player=spotify)


if [[ $active == "Playing" ]] || [[ $active == "Paused" ]]; then
  artist=$(playerctl metadata artist --player=spotify)
  song=$(playerctl metadata title --player=spotify)
  
  # Handle long song names, maybe handle artist too?
  max_length=35
  if [[ ${#song} -gt $max_length ]]; then
    song="${song:0:$max_length}..."
  fi
   
  # no artist, podcast playing --> album is artist
  if [[ $artist  == "" ]]; then
    artist=$(playerctl metadata album --player=spotify)
  fi
  echo "$song - $artist"
else
  echo "" #couldn't find a paused or playing player 
fi

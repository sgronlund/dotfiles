#!/bin/zsh
#
# Simple script which uses `playerctl` to fetch metadata about the player playing,


# Check if anything is playing
active=$(playerctl status -s --player=spotify)


if [[ $active == "Playing" ]] || [[ $active == "Paused" ]]; then
  #TODO: shorten titles if length exceeds n characters
  artist=$(playerctl metadata artist --player=spotify)
  song=$(playerctl metadata title --player=spotify)
  
  # no artist, podcast playing --> album is artist
  if [[ $artist  == "" ]]; then
    artist=$(playerctl metadata album --player=spotify)
  fi
  echo "$song - $artist"
else
  echo "" #couldn't find a pauser or playing player 
fi

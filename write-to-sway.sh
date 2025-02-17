#!/bin/bash

# Get list of displays
displays=$(xrandr | grep " connected" | awk '{print $1}')
for display in $displays; do 
  resolution=$(xrandr | grep "$display" | awk '/+/{print$3}')
  x=$(echo $resolution | awk -F'[ +]' '{print $2}')
  y=$(echo $resolution | awk -F'[ +]' '{print $3}')
  resolution=$(echo $resolution | awk -F '[ +]' '{print $1}')

  echo "output $display pos $x $y res $resolution" >> ~/.config/sway/config
done


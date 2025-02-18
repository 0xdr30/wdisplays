#!/bin/bash

# William Adamson (0xdr30)
# 0xdr30@whoppenheimer.com
# 02/17/2025

# Get list of displays
displays=$(xrandr | grep " connected" | awk '{print $1}')
for display in $displays; do 
  # The resolution of the current display in the series
  resolution=$(xrandr | grep "$display" | awk '/+/{print$3}')
  # Gets the X axis setting of the display
  x=$(echo $resolution | awk -F'[ +]' '{print $2}')
  # Same thing with Y axis
  y=$(echo $resolution | awk -F'[ +]' '{print $3}')
  # Removes the X and Y axis from the resolution string
  # Example: 1920x1080+0+0 --> 1920x1080
  resolution=$(echo $resolution | awk -F '[ +]' '{print $1}')
  # Sends the display name, coordinates, and resolution to the bottom of the sway config
  # Remove the current display configuration
  sed -i "/output $display/d" ~/.config/sway/config
  # Add the new display configuration
  echo "output $display pos $x $y res $resolution" >> ~/.config/sway/config
done

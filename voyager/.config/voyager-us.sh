#!/bin/bash
USER="riikka"
DISPLAY=":0"
XAUTHORITY="/home/$USER/.Xauthority"

export DISPLAY=$DISPLAY
export XAUTHORITY=$XAUTHORITY
# Set all Voyager keyboards to US layout

# Find all device IDs for Voyager keyboards
voyager_ids=$(xinput list | grep "ZSA Technology Labs Voyager" | grep keyboard | awk -F'id=' '{print $2}' | awk '{print $1}')

# Apply US layout to each Voyager device
for id in $voyager_ids; do
  setxkbmap -device "$id" us
done

# Ensure laptop stays Finnish (adjust the MatchProduct name if needed)
laptop_id=$(xinput list | grep "AT Translated Set 2 keyboard" | awk -F'id=' '{print $2}' | awk '{print $1}')
if [ -n "$laptop_id" ]; then
  setxkbmap -device "$laptop_id" fi
fi

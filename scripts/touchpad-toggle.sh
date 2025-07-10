#!/bin/bash

# This is a script to toggle the touchpad on my laptop
# To be used on Xorg session (my bspwm)

# dependencies = (xinput)

# Getting touchpad id
TP_ID=$(xinput list | grep -i touchpad | grep -o 'id=[0-9]*' | cut -d= -f2 | head -n1)
# Getting the current state (0 or 1)
CURR_STATE=$(xinput list-props "$TP_ID"  | grep "Device Enabled" | awk '{print $4}')

if [[ "$CURR_STATE" -eq 1 ]]; then
    xinput disable "$TP_ID"
    notify-send "Touchpad Disabled"
else
    xinput enable "$TP_ID"
    notify-send "Touchpad enabled"
fi

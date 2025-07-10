#!/bin/bash

# This is a script to toggle the mic-led on my laptop
# To be used on Xorg session (my bspwm)

# dependencies = (pactl)

# Toggling the current mic status
pactl set-source-mute @DEFAULT_SOURCE@ toggle
# Getting the current state (0 or 1)
CURR_MUTE_STATE=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')
notify-send '1'

if [[ "$CURR_MUTE_STATE" == "yes" ]]; then
    echo 1 | tee /sys/class/leds/platform::micmute/brightness
else
    echo 0 | tee /sys/class/leds/platform::micmute/brightness
fi

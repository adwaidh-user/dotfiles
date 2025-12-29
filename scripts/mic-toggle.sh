#!/bin/bash

# This is a script to toggle the mic-led on my laptop
# Using pactl since wpctl does not show MUTE label on status

# Toggling the current mic status
pactl set-source-mute @DEFAULT_SOURCE@ toggle
# Getting the current state (0 or 1)
CURR_MUTE_STATE=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')

if [[ "$CURR_MUTE_STATE" == "yes" ]]; then
    brightnessctl -d platform::micmute set 1
else
    brightnessctl -d platform::micmute set 0
fi

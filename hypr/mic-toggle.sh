#!/bin/bash

# This is a script to toggle the mic-led on my laptop
# Using pactl since wpctl does not show MUTE label on status

# Toggling the current mic status
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
# Getting the current state (0 or 1)
CURR_STATE=$( wpctl get-volume @DEFAULT_AUDIO_SOURCE@ )

if echo "$CURR_STATE" | grep -q "MUTED"; then
    brightnessctl -d platform::micmute set 1
else
    brightnessctl -d platform::micmute set 0
fi

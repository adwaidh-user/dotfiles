#!/bin/bash

# Function to check state and run your commands
check_mic_state() {
    # Get mute state of the default microphone (0 = unmuted, 1 = muted)
    # Note: pactl returns "yes" or "no" for mute, so we parse it:
    IS_MUTED=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')
    
    if [ "$IS_MUTED" = "yes" ]; then
        echo "Microphone is MUTED. Running mute command..."
        brightnessctl set -d platform::micmute 1
    else
        echo "Microphone is UNMUTED. Running unmute command..."
        brightnessctl set -d platform::micmute 0
    fi
}

# Run it once at startup to sync initial state
check_mic_state

# Listen to real-time audio events using pactl subscribe
# Whenever a server event happens, we filter for "source" changes
pactl subscribe | while read -r event; do
    if echo "$event" | grep -q "Event 'change' on source"; then
        check_mic_state
    fi
done

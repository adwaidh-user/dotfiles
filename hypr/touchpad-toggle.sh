#!/usr/bin/env bash

TOUCHPAD_NAME=$(hyprctl devices | grep -i -m1 touchpad | awk '{print $1}')

if [ -z "$XDG_RUNTIME_DIR" ]; then
    export XDG_RUNTIME_DIR="/run/user/$(id -u)"
fi

export STATUS_FILE="$XDG_RUNTIME_DIR/touchpad.status"

enable_touchpad() {
    printf "1" > "$STATUS_FILE"
    notify-send -u 'normal' "Enabling touchpad"
    hyprctl keyword "device[$TOUCHPAD_NAME]:enabled" true
}

disable_touchpad() {
    printf "0" > "$STATUS_FILE"
    notify-send -u 'normal' "Disabling touchpad"
    hyprctl keyword "device[$TOUCHPAD_NAME]:enabled" false
}

if ! [ -f "$STATUS_FILE" ]; then
    touch "$STATUS_FILE"
    echo 1 > "$STATUS_FILE"
else
    if [ $(cat "$STATUS_FILE") = "1" ]; then
        disable_touchpad
    elif [ $(cat "$STATUS_FILE") = "0" ]; then
        enable_touchpad
    fi
fi

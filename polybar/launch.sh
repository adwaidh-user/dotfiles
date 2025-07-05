#!/usr/bin/env bash

# Terminate already running bar instances
# Only works if ipc enabled
polybar-msg cmd quit || killall -q polybar
# Otherwise you can use the nuclear option:
# killall -q polybar
BARS=(workspaces window utils)

# Launch bar1 and bar2
for bar in "${BARS[@]}"; do
    echo "---" | tee -a /tmp/${bar}.log
    polybar "$bar" 2>&1 | tee -a /tmp/polybar/${bar}.log & disown
done

echo "Bars launched..."


#!/bin/sh

CHARGE=$( cat /sys/class/power_supply/BAT1/capacity 2>/dev/null )
STATUS=$( cat /sys/class/power_supply/BAT1/capacity 2>/dev/null )

case "$STATUS" in
  "Charging") ICON="󱐋"
  ;;
  "Not charging")
    AC_STATUS=$( cat /sys/class/power_supply/ACAD/online 2>/dev/null )
    if [[ AC_STATUS -eq 1 ]]; then
      ICON=""
    fi
  ;;
  *) ICON="❤"
  ;;
esac
echo "$ICON $CHARGE"


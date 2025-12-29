#!/usr/bin/env bash

power_options=(
  'Shut_Down'
  'Reboot'
  'Suspend'
  'Hibernate'
  'Log_Out'
)

choice=$(echo "$power_options" | sed 's/ /\n/g' | sed 's/_/ /g' | wofi --dmenu)

case "$choice" in
  'Shut Down') echo 1
  ;;
  'Reboot') echo 2 or 3
  ;;
  *) echo default
  ;;
esac


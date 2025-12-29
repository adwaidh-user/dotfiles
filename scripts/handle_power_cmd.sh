echo "yes\nno" | wofi --dmenu

if [[ $opt -eq "yes" ]]; then
  case $opt in 
    SHUTDOWN)
      systemctl shutdown
      ;;
    RESTART)
      systemctl shutdown
      ;;
    SUSPEND)
      systemctl shutdown
      ;;
    HIBERNATE)
      systemctl shutdown
      ;;
  esac
fi

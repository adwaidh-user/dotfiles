#Actions
timeExecd=$(date +%Y%m%d_%H%M%S)
DIR="$HOME/Pictures/Screenshot"
FILE_NAME="$DIR/$timeExecd.png"
dir="$HOME/.config/rofi/Screenshot/type-1"
theme='style-5'

full="  Full"
window="  Window"
area="󰆾  Select Area"
cancel="󰈆  Cancel"

rofi_cmd() {
	rofi -dmenu \
		-mesg " Choose Mode" \
		-theme ${dir}/${theme}.rasi
}

run_rofi() {
	echo -e "$full\n$window\n$area\n$cancel" | rofi_cmd
}

chosen="$(run_rofi)"
case "$chosen" in
  $full)
    sleep 0.4
    grim "$FILE_NAME" && notify-send grim "Screenshot saved as $FILE_NAME"
  ;;
  $window)
    geometry=$(hyprctl activewindow -j | jq -r '[.at[], .size[]] | "\(.[0]),\(.[1]) \(.[2])x\(.[3])"')
    if [[ $? -eq 0 ]]; then
      sleep 0.4
      grim -g "$geometry" "$FILE_NAME" && notify-send grim "Screenshot saved as $FILE_NAME"
    fi
  ;;
  $area)
    geometry=$(slurp)
    if [[ $? -eq 0 ]]; then
      sleep 0.4
      grim -g "$geometry" "$FILE_NAME" && notify-send grim "Screenshot saved as $FILE_NAME"
    fi
  ;;
esac


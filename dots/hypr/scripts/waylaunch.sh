#!/run/current-system/sw/bin/env fish

pkill -9 .waybar-wrapped
sleep 2

waybar &

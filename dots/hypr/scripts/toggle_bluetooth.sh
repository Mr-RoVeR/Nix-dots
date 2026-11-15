#!/run/current-system/sw/bin/env fish

if bluetoothctl show | grep -q 'Powered: yes'
    bluetoothctl power off >/dev/null
    notify-send -e -u low "Bluetooth Disabled" "Bluetooth has been turned off"
else
    rfkill unblock bluetooth 2>/dev/null
    if bluetoothctl power on >/dev/null
        notify-send -e -u low "Bluetooth Enabled" "Bluetooth has been turned on"
    else
        notify-send -u normal "Bluetooth" "Couldn't turn Bluetooth on"
    end
end

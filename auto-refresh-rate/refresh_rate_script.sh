#!/bin/bash
# /usr/local/bin/set-refresh-rate.sh
# Simple script to change display refresh rate using gnome-randr

set -e

# Function to get the GNOME user
get_gnome_user() {
    ps aux | grep "gnome-shell" | grep -v grep | head -1 | awk '{print $1}'
}

# Function to set refresh rate using gnome-randr
set_refresh_rate() {
    local mode=$1
    local gnome_user=$(get_gnome_user)
    local user_id=$(id -u "$gnome_user" 2>/dev/null || echo "1000")
    
    if [[ -z "$gnome_user" ]]; then
        echo "Could not find GNOME user" >&2
        return 1
    fi
    
    echo "Setting display mode to $mode for user $gnome_user"
    
    sudo -u "$gnome_user" \
        DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$user_id/bus" \
        gnome-randr modify eDP-2 --mode "$mode"
}

# Main logic
main() {
    local power_state=$1
    
    case "$power_state" in
        "ac")
            echo "AC power detected - setting 300Hz refresh rate"
            set_refresh_rate "1920x1080@300.000"
            ;;
        "dc")
            echo "Battery power detected - setting 60Hz refresh rate"
            set_refresh_rate "1920x1080@59.999"
            ;;
        *)
            echo "Usage: $0 {ac|dc}"
            exit 1
            ;;
    esac
}

# Log to systemd journal
echo "Power refresh rate change: $1 ($(date))" | systemd-cat -t refresh-rate-udev

main "$@"

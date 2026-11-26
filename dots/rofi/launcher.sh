#!/run/current-system/sw/bin/env bash
set -euo pipefail

dir="$HOME/nixos-config/dots/rofi"
theme='style'
mode="${1:-drun}"

ID="linux"
NAME="Linux"
VERSION_ID=""
if [ -r /etc/os-release ]; then
    source /etc/os-release
fi

case "$ID" in
    nixos)   ICON="" ;;
    gentoo)  ICON="" ;;
    arch)    ICON="" ;;
    fedora)  ICON="" ;;
    freebsd) ICON="" ;;
    debian)  ICON="" ;;
    ubuntu)  ICON="" ;;
    *)       ICON="" ;;
esac

DISTRO_SPACED="$(sed 's/./& /g; s/ $//' <<< "${NAME^^}")"

if [ -n "${HYPRLAND_INSTANCE_SIGNATURE:-}" ]; then
    WM="Hyprland"
elif [ -n "${XDG_CURRENT_DESKTOP:-}" ]; then
    WM="$XDG_CURRENT_DESKTOP"
else
    WM="Wayland"
fi

if [ "$ID" = "nixos" ]; then
    GEN="$(readlink /nix/var/nix/profiles/system 2>/dev/null | grep -oE '[0-9]+' || echo '?')"
    ENV_INFO="Gen ${GEN}"
elif [ -d /run/systemd/system ]; then
    ENV_INFO="systemd"
elif [ -d /run/openrc ]; then
    ENV_INFO="OpenRC"
else
    ENV_INFO="init"
fi

KERNEL="$(uname -r | cut -d'-' -f1)"
read -r UP_SEC _ < /proc/uptime
UP_INT="${UP_SEC%.*}"
UP_H="$((UP_INT / 3600))"
UP_M="$(((UP_INT % 3600) / 60))"
VER_PART="${VERSION_ID:+${VERSION_ID} · }"
STATS="${VER_PART}${KERNEL} · up ${UP_H}h ${UP_M}m"

ART="<span size='57344' foreground='#c89bff'>${ICON}</span>&#10;&#10;<span size='13312' foreground='#e2e8ff'><b>${DISTRO_SPACED}</b></span>&#10;<span size='10240' foreground='#7d80a3'>${WM} · ${ENV_INFO}</span>&#10;<span size='8704' foreground='#4d4e6b'>${STATS}</span>"

exec rofi \
    -show "$mode" \
    -theme "${dir}/${theme}.rasi" \
    -theme-str "textbox-logo   { str: \"${ICON}\"; }" \
    -theme-str "textbox-distro { str: \"${DISTRO_SPACED}\"; }" \
    -theme-str "textbox-sub    { str: \"${WM} · ${ENV_INFO}\"; }" \
    -theme-str "textbox-stats  { str: \"${STATS}\"; }"

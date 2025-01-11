#!/bin/sh

~/.config/hypr/scripts/spotify.sh
~/.config/hypr/scripts/youtube.sh
~/.config/hypr/scripts/chatgpt.sh
~/.config/hypr/scripts/browser.sh
sleep 0.5
hyprctl dispatch focusmonitor:DP-1
hyprctl dispatch workspace 2

# spotify &
# hyprctl dispatch workspace 2
# sleep 1
# ~/.config/hypr/scripts/browser.sh
# ~/.config/hypr/scripts/youtube.sh
# hyprctl dispatch focusmonitor 1
# hyprctl dispatch workspace 1
# $terminal --hold bash -c "fastfetch --logo-type none --config ~/.config/fastfetch/micro.jsonc"

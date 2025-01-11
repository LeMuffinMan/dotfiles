#!/bin/sh

wallpaper_dir="/home/muffin/.config/hypr/wallpapers/save2/"
wallpaper_file="/home/muffin/.config/hypr/wallpapers/save2/wallpaper.jpg"
wallpaper=$(find "$wallpaper_dir" -type f | shuf -n 1)

cp -f $wallpaper $wallpaper_file
pkill hyprpaper && hyprpaper &

# hyprctl notify "Wallpaper : "$wallpaper


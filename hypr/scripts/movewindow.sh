#!/bin/bash

# WINX=$(hyprctl activewindow | grep "at: " | awk '{print$2}' | awk -F ',' '{print$1}')
# WINY=$(hyprctl activewindow | grep "at: " | awk '{print$2}' | awk -F ',' '{print$2}')
#
hyprctl dispatch centerwindow 


#!/bin/sh

WS=$(hyprctl activeworkspace| grep "workspace ID" | awk -F ' ' '{print$3}')
WINDOW="$(hyprctl clients | grep "class: Vivaldi-stable" | wc -l)"
VIVALDI=&(hyprctl clients | grep -A 4 "class: Vivaldi-stable" | grep "pid: " | sed 's/\t//g')
AC=$(hyprctl activewindow | grep "Vivaldi-stable" | wc -l)
echo $WS
echo $WINDOW
echo $VIVALDI
echo $AC

if [[ "$WS" == "10" && "$AC" -eq 0 ]]; then
    echo 'ici'
    hyprctl dispatch movefocus l
fi
if (($WINDOW == 1)); then
    hyprctl focusmonitor ID: 1
    hyprctl dispatch workspace 10
    AC=$(hyprctl activewindow | grep "Vivaldi-stable" | wc -l)
    if (($AC == 0)); then
        hyprctl dispatch movefocus l
    fi
else
    vivaldi & 
fi

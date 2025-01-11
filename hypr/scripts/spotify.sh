
#!/bin/sh

WS=$(hyprctl activeworkspace | grep "workspace ID" | awk -F ' ' '{print$3}')
WINDOW="$(hyprctl clients | grep "class: Spotify" | wc -l)"
SPOTIFY=&(hyprctl clients | grep -A 4 "class: Spotify" | grep "pid: " | sed 's/\t//g')
AC=$(hyprctl activewindow | grep "Spotify" | wc -l)
echo $SPOTIFY

if [[ "$WS" == "11" && "$AC" -eq 0 ]]; then
    hyprctl dispatch movefocus l
fi
if (($WINDOW == 1)); then
    hyprctl focusmonitor ID: 0
    hyprctl dispatch workspace 11
    AC=$(hyprctl activewindow | grep "Spotify" | wc -l)
    if (($AC == 0)); then
        hyprctl dispatch movefocus l
    fi
else
    spotify & 
fi
# windows="$(hyprctl workspaces | grep "workspace ID 8" -A 3 | grep "windows" | awk '{print $2}' | wc -l)"
#
# if ((windows == 0))
# then
#     spotify
# else
#     hyprctl dispatch workspace 10
# fi

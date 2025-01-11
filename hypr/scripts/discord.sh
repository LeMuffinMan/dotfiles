
#!/bin/sh

windows="$(hyprctl clients | grep "class: discord" | wc -l)"

if ((windows == 0))
then
    hyprctl dispatch workspace 7
    discord
else
    hyprctl dispatch workspace 7
fi

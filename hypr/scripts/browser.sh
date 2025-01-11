
#!/bin/sh

windows="$(hyprctl clients | grep "class: firefox" | wc -l)"

echo $windows

if ((windows == 0))
then
    hyprctl dispatch focusmonitor 1
    hyprctl dispatch workspace 2
    firefox &
else
    hyprctl dispatch focusmonitor 1
    hyprctl dispatch workspace 2
fi

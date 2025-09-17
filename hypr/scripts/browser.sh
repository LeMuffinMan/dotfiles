
#!/bin/sh

windows="$(hyprctl clients | grep "class: zen" | wc -l)"

echo $windows

if ((windows == 0))
then
    hyprctl dispatch focusmonitor 1
    hyprctl dispatch workspace 2
    zen-browser &
else
    hyprctl dispatch focusmonitor 1
    hyprctl dispatch workspace 2
fi

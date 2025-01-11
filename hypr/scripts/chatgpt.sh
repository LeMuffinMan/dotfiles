
#!/bin/sh

windows="$(hyprctl clients | grep "Class: Chromium" | wc -l)"

if ((windows == 0))
then
    hyprctl dispatch workspace 9
    chromium --disable-session-crashed-bubble https://chatgpt.com & 
else
    hyprctl dispatch workspace 9
fi

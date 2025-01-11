#!/bin/sh

WS=$(hyprctl activeworkspace | head -n 1 | awk '{print$3}')
STACH=99

if (($(hyprctl clients | grep -A 1 "workspace: $WS" | grep "floating: 1" | wc -l) > 0)) then
  while (($(hyprctl clients | grep -A 1 "workspace: $WS" | grep "floating: 1" | wc -l) > 0)) do
    hyprctl dispatch movetoworkspacesilent $STACH, pid:$(hyprctl clients | grep -A 8 "workspace: $WS" | grep -A 7 "floating: 1" | grep "pid: " | head -n 1 | awk '{print$2}')
  done
else
  while (($(hyprctl clients | grep -A 1 "workspace: $STACH"| grep "floating: 1" | wc -l) > 0)) do
    hyprctl dispatch movetoworkspace $WS, pid:$(hyprctl clients | grep -A 8 "workspace: $STACH" | grep "pid: " | awk '{print$2}' | head -n 1)    # hyprctl dispatch focuswindow floating
  done
fi


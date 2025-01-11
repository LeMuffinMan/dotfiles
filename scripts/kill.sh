#!/bin/bash

CLASS=$(hyprctl activewindow | grep "class: kitty" |  wc -l)
PID=$(hyprctl activewindow | grep "pid: " | sed "s/^\tpid: //g")

if (($CLASS > 0)) then
  kill $PID
  sleep 1
else
  hyprctl dispatch killactive
fi


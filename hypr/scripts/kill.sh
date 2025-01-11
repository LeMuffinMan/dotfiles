#!/bin/sh

kitty -e bash -c "read"

touch /tmp/test.log
WIN=$(hyprctl activewindow | grep "class: kitty" | wc -l)

echo $WIN > /tmp/test.log 
if (($WIN == 1))
then
  kill $(hyprctl activewindow | grep "pid: " | awk '{print$2}')
  echo 'killed' >> /tmp/test.log
else
  hyprctl dispatch killactive
  echo 'soft' >> /tmp/test.llog
fi

#/bin/sh

findme=$(hyprctl clients | grep -B 4 "class: code-oss" | head -n 1 | awk '{print $2}' | wc -l)
workspace=$(hyprctl clients | grep -B 4 "class: code-oss" | head -n 1 | awk '{print $2}')

  echo $workspace
  if (($findme > 0))
then
  hyprctl dispatch workspace $workspace
else 
  hyprctl dispatch workspace empty
  code-oss
fi

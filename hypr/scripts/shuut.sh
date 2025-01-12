kill_window()
{
  # sleep 0.1
  tokill=$(hyprctl activeworkspace | grep "lastwindow: " | awk '{print $2}' | sed 's/^0x//')
  pid=$(hyprctl clients | grep  -A 13 "$tokill" | tail -n 1 | awk '{print$2}')
  kill $pid
  # sleep 1
}

kill_workspace()
{
  while true; do

    findwin=$(hyprctl activeworkspace | grep "lastwindow: " | awk '{print $2}' | sed 's/^0x//')
    echo $findwin
    if (("$findwin" == "0"))
    then
      break
    else
    kill_window
    fi
  done
}

kill_workspace
pkill firefox
pkill vivaldi
pkill spotify
sleep 1
kitty -e --class "shut" bash -c "bash ~/.config/hypr/scripts/statsess.sh; echo -e '\n'; fastfetch --logo arch_small --config ~/.config/fastfetch/shuut.jsonc; read; sudo shutdown now"

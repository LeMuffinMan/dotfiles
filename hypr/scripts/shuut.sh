
kill_workspace()
{
  WS=$(hyprctl activeworkspace | grep "workspace ID" | awk '{print$3}')

  while true; do

    TOTALWIN=$(hyprctl activeworkspace | grep "windows: " | awk '{print$2}' | head -n 1)
    if (("$TOTALWIN" == "0"))
    then
      break
    else
    pid=$(hyprctl clients | grep -A 8 "workspace: $WS" | grep "pid: " | head -n 1 | awk '{print$2}')
    kill $pid
    fi
  done
}

gitdotfiles ()
{
  cd /home/muffin/dotfiles/
  STATUS=$(git status)
  PULL=$(echo "$STATUS" | grep "Your branch is up to date with 'origin/main'." | wc -l )
  COMMIT=$(echo "$STATUS" | grep "Your branch is ahead of 'origin/main' by" | wc -l )
  UNSTAGED=$(echo "$STATUS" | grep "Changes not staged for commit:" | wc -l )
  # echo -e "$STATUS"
  echo -e "$PULL"
  echo -e "$COMMIT"
  echo -e "$UNSTAGED"
}

kill_workspace
pkill firefox
pkill vivaldi
pkill spotify
sleep 1
kitty -e --class "shut" bash -c "bash ~/.config/hypr/scripts/statsess.sh; echo -e '\n'; fastfetch --logo arch_small --config ~/.config/fastfetch/shuut.jsonc; read; sudo shutdown now"

#!/bin/bash

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
  UNTRACKED=$(echo "$STATUS" | grep "Untracked files:" | wc -l )
  UPTODATE=$(echo "$STATUS" | grep "nothing to commit, working tree clean" | wc -l )


  if [[ $UPTODATE == 1 ]];
  then
    echo 'Dotfiles: nothing to commit, working tree clean'
    exit 0
  else
    echo 'Dotfiles: '
  fi

  if [[ $PULL == 0 ]];
  then
    echo 'Need a pull !'
  fi

  if [[ $UNSTAGED > 0 ]];
  then
    echo 'Files modified to commit !'
    echo ''
    echo "$(echo "$STATUS" | grep "modified: " | awk '{print$2}' )"
    echo ''
    # echo 'TOSTAGE'
  fi

  if [[ $UNTRACKED > 0 ]];
  then
    echo 'New files to commit'
  fi

}
 
GITCHECK=$(gitdotfiles)

if [[ $(echo "$GITCHECK" | wc -l) > 1 ]];
then
  echo "$GITCHECK"
  kitty -e --class "gitstatus" bash -c " /home/muffin/dotfiles/scripts/git.sh"
else
  kill_workspace
  pkill firefox
  pkill vivaldi
  pkill spotify
  sleep 1
  kitty -e --class "shut" bash -c "
                bash ~/.config/hypr/scripts/statsess.sh; 
                echo -e '\n'; 
                fastfetch --logo arch_small --config ~/.config/fastfetch/shuut.jsonc; 
                read; 
                sudo shutdown now"
fi

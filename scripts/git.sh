#!/bin/bash

cd /home/muffin/dotfiles/
git status
echo ''
echo 'Yolo commit ? y/n'
read CO
if [[ $CO == 'y' ]];
then
  git add *
  git yolo
  echo ''
  echo "commit : $(git log | head -n 5 | tail -n 1)"
  echo ''
  git push
  echo 'Shutdown now ? y/n'
  read SH
  if [[ $SH == 'y' ]];
  then 
    ~/dotfiles/hypr/scripts/shuut.sh
  fi
  exit 0
else
  zsh
fi


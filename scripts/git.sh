#!/bin/bash

cd /home/muffin/dotfiles/
git status
echo 'Yolo commit ? y/n'
read YN
if [[ $YN == 'y' ]];
then
  git add *
  git yolo
  echo "commit : $(git log | head -n 5 | tail -n 1)"
  git push
  echo 'Press any key to quit'
  read
else
  zsh
fi


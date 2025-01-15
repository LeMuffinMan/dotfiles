#!/bin/bash

cd /home/muffin/dotfiles/
git status
echo ''
echo 'Yolo commit ? y/n'
read CO
echo ''
if [[ $CO == 'y' ]];
then
  git add *
  git yolo
  echo "commit : $(git log | head -n 5 | tail -n 1)"
else
  echo -e 'git commit -m'
  read COMMIT
  git add *
  git commit -m "$COMMIT"
fi
  echo ''
  git push
  echo ''
  echo 'Shutdown now ? y/n'
  read SH
  if [[ $SH == 'y' ]];
  then 
    exit 1
  fi
  exit 0
else
  zsh
fi


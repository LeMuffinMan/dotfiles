#!/bin/bash

cd /home/muffin/dotfiles/
git status
echo 'Yolo commit ? y/n'
git add *
git yolo
echo "commit : $(git log | head -n 5 | tail -n 1)"
read


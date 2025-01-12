#!/bin/bash

# kitty --hold -e bash -c 'checkupdates-with-aur && sudo pacman -Syu && yay -Syu';

NUMBER="$(checkupdates-with-aur | wc -l)"
PKG=$(checkupdates-with-aur)

touch /home/muffin/logs/update.log
echo "$PKG" > /home/muffin/logs/update.log

if [[ $NUMBER -gt 0 ]]
then
    kitty -e bash -c "echo '$PKG'
              echo -e '$NUMBER packages to update.';
              read;
              echo 'sudo pacman -Syu | tee /var/log/pacman_update_$(date +%Y-%m-%d).log';
              echo -e '\nUpdate completed press any key to quit';
              read;"
else
    kitty -e bash -c "echo -e '\nYour system is up to date';
                  read;"
fi

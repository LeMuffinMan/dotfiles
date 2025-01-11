#!/bin/bash

# kitty --hold -e bash -c 'checkupdates-with-aur && sudo pacman -Syu && yay -Syu';

number="$(sudo checkupdates-with-aur | wc -l)"
pkg=$(sudo checkupdates-with-aur)

touch /tmp/update.log
echo "$(pkg)" > /tmp/update.log

if (($number > 0))
then
    kitty -e bash -c "echo -e '$number packages to update.';
                  read;
                  echo 'sudo pacman -Syu | tee /var/log/pacman_update_$(date +%Y-%m-%d).log';
                  echo -e '\nUpdate completed press any key to quit';
                  read;"
else
    kitty -e bash -c "echo -e '\nYour system is up to date';
                  read;"
fi

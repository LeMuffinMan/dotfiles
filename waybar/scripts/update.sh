#!/bin/sh

UP=$(cat /tmp/update.log | wc -l)

echo $UP

if [[ $UP == 0 ]]; then
     kitty -e --class "update" bash -c "echo 'No packages du to update.'; read;"
else
     kitty -e --class "update" bash -c "
     echo '$UP package(s) to upgrade :';
     echo ''
     cat /tmp/update.log;
     echo '';
     sudo pacman -Syu;
     echo 'sudo pacman -Syu | tee /var/log/pacman_update_$(date +%Y-%m-%d).log';
     echo -e '\nUpdate completed press any key to quit';
     read;"
fi


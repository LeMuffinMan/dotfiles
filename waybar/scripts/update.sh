#!/bin/sh

UP=$(checkupdates-with-aur | wc -l)

echo $UP

if (($UP -gt 0))
then
                  kitty -e --class "update" bash -c "cat /tmp/update.log;
                                    read;
                                    sudo pacman -Syu | sudo tee /var/log/pacman-update.log;
                                    echo -e '' > /tmp/update.log
                                    cp -f /var/log/pacman-update.log /var/log/pacman-lastupdate.log 
                                    echo -e '\nUpdate completed press any key to quit';
                                    read;"
else
                  kitty -e --class "update" bash -c "echo 'No packages du to update.'; read;"
fi


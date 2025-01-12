#!/bin/bash

MONITORS=$(hyprctl monitors | grep Monitor | wc -l)
MONITORLOGS=$(hyprctl monitors)

touch /home/muffin/logs/switchconfig.log

echo "$MONITORS monitors found $(date +%Y-%m-%d)" > /home/muffin/logs/switchconfig.log
echo '' >> /home/muffin/logs/switchconfig.log
echo "$MONITORLOGS" >> /home/muffin/logs/switchconfig.log

if [[ $MONITORS == 1 ]];
then
  echo '1 monitors config loaded' >> /home/muffin/logs/switchconfig.log
  cp ~/dotfiles/hypr/conf/1monitors.conf ~/dotfiles/hypr/conf/monitors.conf 2>> /home/muffin/logs/switchconfig.log
  cp ~/dotfiles/hypr/conf/1input.conf ~/dotfiles/hypr/conf/input.conf 2>> /home/muffin/logs/switchconfig.log
  cp ~/dotfiles/hypr/conf/1windowrules.conf ~/dotfiles/hypr/conf/windowrules.conf 2>> /home/muffin/logs/switchconfig.log
  cp ~/dotfiles/hypr/conf/1keybindings.conf ~/dotfiles/hypr/conf/keybindings.conf 2>> /home/muffin/logs/switchconfig.log
fi

if [[ $MONITORS == 2 ]];
then
  echo '2 monitors config loaded' >> /home/muffin/logs/switchconfig.log
  cp ~/dotfiles/hypr/conf/2monitors.conf ~/dotfiles/hypr/conf/monitors.conf 2>> /home/muffin/logs/switchconfig.log
  cp ~/dotfiles/hypr/conf/2input.conf ~/dotfiles/hypr/conf/input.conf 2>> /home/muffin/logs/switchconfig.log
  cp ~/dotfiles/hypr/conf/2windowrules.conf ~/dotfiles/hypr/conf/windowrules.conf 2>> /home/muffin/logs/switchconfig.log
  cp ~/dotfiles/hypr/conf/2keybindings.conf ~/dotfiles/hypr/conf/keybindings.conf 2>> /home/muffin/logs/switchconfig.log
fi


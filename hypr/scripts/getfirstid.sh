#!/bin/sh

touch /tmp/statsess

echo '' > /tmp/statsess //reset stats
echo '' > /tmp/kittycount

export HISTFILE=~/.zsh_history
history -r  # Recharge l'historique
id=$(fc -l 10000 | grep "Hyprland" | tail -n 1 | awk '{print$1}')
echo "id: $id" > /tmp/statsess
# found=false
# "$list" | tac | while read ligne; do
#   if [[ "$ligne" =~ ^"$id" ]]; then
#     break
#   fi
#   # echo "$ligne"  # Affiche la ligne
# done
# id=$(fc -l | tail -n 1)
# echo "$id"

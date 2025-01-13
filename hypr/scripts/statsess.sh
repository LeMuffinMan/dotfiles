#!/bin/sh

export HISTFILE=~/.zsh_history
history -r  # Recharge l'historique

id=$(cat /tmp/statsess | head -n 1 | awk '{print$2}')
last=$(fc -l 2000 | tail -n 1 | awk '{print$1}')
nb_command=$((last - id + 1))
TERM=$(cat /tmp/kittycount | wc -l)
date_log=$(cat /var/log/pacman.log | grep "upgraded" | tail -n 1 | awk '{print$1}' | tr -d '[]')
formatted_date=$(date -d "${date_log//T/ }" "+%d/%m/%Y - %H:%M")
PKGU=$(checkupdates-with-aur | wc -l)


echo -e "\n\t\tMY SESSION STATS\n"

echo -e "Terminals opened\t:\t$TERM"
echo -e "Command lines\t\t:\t$nb_command"
# echo -e "Most used cmd\t\t:\t\t"
echo -e ""
echo -e "Last update\t\t:\t$formatted_date"
echo -e "Packages to udpate\t:\t$PKGU"
# echo -e "Packages installed\t:\t"
# echo -e "Disk space diff\t\t:\t\t"
# echo -e "Errors / warning\t:\t\t"
# echo -e ""
echo ''
echo 'Dotfiles: nothing to commit, working tree clean'



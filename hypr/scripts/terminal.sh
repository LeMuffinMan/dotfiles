# touch /tmp/kittycount
#
# echo "$(date +%D-%H:%M:%S)" >> /tmp/kittycount

X=$(($(hyprctl cursorpos | awk '{print$1}' | sed 's/,//g') + 30))
Y=$(($(hyprctl cursorpos | awk '{print$2}') + 30))
ISFLOAT=$(hyprctl activewindow | grep "floating: " | awk '{print$2}')

if [[ "$ISFLOAT" == 1 ]] then
  hyprctl dispatch movecursor $X $Y
fi

kitty bash -c "zsh"

# if [[ -d "/home/muffin'$CWD'" ]]; then
#   echo "valide cwd : '$CWD'"
# else
#   echo "no cwd : '$CWD'"
# fi

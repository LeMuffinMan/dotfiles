touch /tmp/kittycount

echo "$(date +%D-%H:%M:%S)" >> /tmp/kittycount

CLASS=$(hyprctl activewindow | grep "class: " | awk '{print$2}')
CWD=$(hyprctl activewindow | grep "title: " | awk '{print$2}') # | awk -F '~' '{print$2}' | awk -F ')' '{print$1}')
X=$(($(hyprctl cursorpos | awk '{print$1}' | sed 's/,//g') + 30))
Y=$(($(hyprctl cursorpos | awk '{print$2}') + 30))
ISFLOAT=$(hyprctl activewindow | grep "floating: " | awk '{print$2}')
INPUT=$CWD
ISFILE=$(echo $INPUT | grep "~" | wc -l )
INPUTCLEAN=$( echo $INPUT | sed 's/muffin@ArchZen://' | sed 's/^~/\/home\/muffin/' | sed '/^\/home\/muffin\/\.trash/d')

if [[ $ISFILE == 1 ]]; then
  CWDR=$INPUTCLEAN
else
  CWD=$(find /home/muffin/ -type f -name "$INPUT" | sed '/^\/home\/muffin\/\.local\/share/d'  )
  CWDR=$(dirname "$CWD")
fi
if [[ "$ISFLOAT" == 1 ]] then
  hyprctl dispatch movecursor $X $Y
fi

if [[ -d "$CWDR" ]]; then
  kitty --directory $CWDR bash -c "fastfetch --logo-type none --config ~/.config/fastfetch/micro.jsonc; zsh"
else
  kitty bash -c "fastfetch --logo-type none --config ~/.config/fastfetch/micro.jsonc; zsh"
fi

# if [[ -d "/home/muffin'$CWD'" ]]; then
#   echo "valide cwd : '$CWD'"
# else
#   echo "no cwd : '$CWD'"
# fi

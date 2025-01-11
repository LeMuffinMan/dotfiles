

CLASS=$(hyprctl activewindow | grep "class: " | awk '{print$2}')
CWD=$(hyprctl activewindow | grep "title: " | awk '{print$2}') # | awk -F '~' '{print$2}' | awk -F ')' '{print$1}')
WS=$(hyprctl activeworkspace | grep "workspace ID " | awk '{print$3}')
FLOATS=$(hyprctl clients | grep -A 1 "workspace: $WS" | grep "floating: 1" | wc -l)
X=$(($(hyprctl cursorpos | awk '{print$1}' | sed 's/,//g') + 30))
Y=$(($(hyprctl cursorpos | awk '{print$2}') + 30))
INPUT=$CWD
ISFILE=$(echo $INPUT | grep "~" | wc -l )
INPUTCLEAN=$( echo $INPUT | sed 's/muffin@ArchZen://' | sed 's/^~/\/home\/muffin/' | sed '/^\/home\/muffin\/\.trash/d')

if [[ $ISFILE == 1 ]]; then
  CWDR=$INPUTCLEAN
else
  CWD=$(find /home/muffin/ -type f -name "$INPUT" | sed '/^\/home\/muffin\/\.local\/share/d'  )
  CWDR=$(dirname "$CWD")
fi
if [[ $FLOATS == 0 ]]; then
  hyprctl dispatch movecursor 2500 1125
elif [[ $FLOATS == 1 ]]; then
  hyprctl dispatch movecursor 3900 1125 
elif [[ $FLOATS == 2 ]]; then
  hyprctl dispatch movecursor 3900 400 
elif [[ $FLOATS == 3 ]]; then
  hyprctl dispatch movecursor 2500 400
elif [[ $FLOATS == 4 ]]; then
  hyprctl dispatch movecursor 3195 730
elif [[ $FLOATS > 4 ]]; then
  hyprctl dispatch movecursor $X $Y
fi

if [[ -d "$CWDR" ]]; then
  kitty --directory $CWDR bash -c "fastfetch --logo-type none --config ~/.config/fastfetch/micro.jsonc; zsh"
else
  kitty bash -c "fastfetch --logo-type none --config ~/.config/fastfetch/micro.jsonc; zsh"
fi

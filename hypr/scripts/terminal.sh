# TITLE=$(hyprctl activewindow | grep 'title: ')

get_cwd() {

  local INPUT=$1
  local HOM=$(echo $INPUT | grep "~" | wc -l)
  local PAT=$(echo $INPUT | sed 's/~/\/home\/muffin/g' | sed 's/muffin@ArchZen://g')
  local IS_TILED=$(echo $INPUT | grep -E "^~$" | wc -l)
  # Si on a juste la tilde
  if (($IS_TILED == 1)) then
    echo "$HOME"
    return
  fi
  local FIND_OUT=$(find $HOME -type f -name "$INPUT" | grep -v "^/home/muffin/dotfiles" | grep -v "^/home/muffin/.local/share/nvim/lazy")
  local FIND_COUNT=$(echo "$FIND_OUT" | wc -l)
  local IS_DIR=$(echo "$PAT" | grep "/" | wc -l)
  #si on trouve un fichier 
  if (($FIND_COUNT == 1)); then
    if (($IS_DIR == 1)); then
      echo $PAT
      return 
    elif (($IS_DIR == 1)); then
      echo $PAT
      return 
    fi
    echo $(dirname $FIND_OUT)
    return
  fi
  #Si on trouve aucun ou plus de 1 fichier
  if (($FIND_COUNT > 1 || $FIND_COUNT == 0)) then
    echo $HOME
    return
  fi
}

touch /tmp/kittycount

echo "$(date +%D-%H:%M:%S)" >> /tmp/kittycount

CLASS=$(hyprctl activewindow | grep "class: " | awk '{print$2}')
CWD=$(hyprctl activewindow | grep "title: " | awk '{print$2}') # | awk -F '~' '{print$2}' | awk -F ')' '{print$1}')
CWDR=$(get_cwd $CWD)
X=$(($(hyprctl cursorpos | awk '{print$1}' | sed 's/,//g') + 30))
Y=$(($(hyprctl cursorpos | awk '{print$2}') + 30))
ISFLOAT=$(hyprctl activewindow | grep "floating: " | awk '{print$2}')

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

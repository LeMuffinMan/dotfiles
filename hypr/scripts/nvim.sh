WSID=$(hyprctl activeworkspace | grep "workspace ID" | awk -F " " '{print$3}')
WFLOAT=$(hyprctl clients | grep -A 1 "workspace: $WSID" | grep "floating: 1" | wc -l)
WTILED=$(hyprctl clients | grep -A 1 "workspace: $WSID" | grep "floating: 0" | wc -l)

#
if (($WTILED < 2))
then
  kitty -e --class "nvimtiled" bash -c 'nvim'
else
  kitty -e --class "nvim" bash -c 'nvim'
fi

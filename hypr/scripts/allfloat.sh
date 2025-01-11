# WSID=$(hyprctl activeworkspace | grep "workspace ID" | awk -F " " '{print$3}')
# WFLOAT=$(hyprctl clients | grep -A 1 "workspace: 3" | grep "floating: 1" | wc -l)
# WTILED=$(hyprctl clients | grep -A 1 "workspace: 3" | grep "floating: 0" | wc -l)
#
# echo $WFLOAT
# echo $WTILED
# echo $WSID


hyprctl dispatch workspaceopt allfloat


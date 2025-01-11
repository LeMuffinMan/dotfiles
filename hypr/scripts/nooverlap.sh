# #!/bin/sh
#
#
#
#

if (($(hyprctl activewindow | grep "floating: 1" | wc -l) > 0)) then
  X=$(hyprctl activewindow | grep "at: " | sed "s/\tat: //g" | awk -F ',' '{print$1}')
  echo $X 
  Y=$(hyprctl activewindow | grep "at: " | sed "s/at: //g" | awk -F ',' '{print$2}')
  echo $Y
  X1=$((X + 5))
  echo $X1
  Y1=$((Y + 5))
  echo $Y1
  # hyprctl dispatch exec kitty 
  kitty --hold &
  sleep 1
  hyprctl dispatch movewindowpixel exact 50 50
  # $X1 $Y1
fi
#
#
#
#
#
#
#
#
#
#
#
#
#
# NEWWIN=$(hyprctl activewindow | grep "at: ")
# NEW_WIN_X=$(hyprctl activewindow | grep "at: " | awk '{print$2}' | awk -F ',' '{print$1}')
# NEW_WIN_Y=$(hyprctl activewindow | grep "at: " | awk '{print$2}' | awk -F ',' '{print$2}')
# WIN=$(hyprctl clients | grep -B  2 "workspace: 3" | grep "at: " | sort -r)
#
# is_overlapping() {
#   local NEW_WIN_X="$1"
#   local NEW_WIN_Y="$2"
#   while IFS= read -r ligne; do
#     if [[ "$NEW_WIN_X" == "$ligne" ]]; then
#       while IFS= read -r ligne; do
#         if [[ "$NEW_WIN_Y" == "$ligne" ]]; then
#           return 0
#         fi
#       done <<< "$(echo $WIN | awk -F '{print$2}')"
#     fi
#   done <<< "$(echo $WIN | awk -F '{print$1}')"
#   return 1
# }
#
#
# kitty --hold &
#
# while is_overlapping "WIN" "NEWWIN"; do
#       NEW_WIN_X=$((NEW_WIN_X + 50))
#       NEW_WIN_Y=$((NEW_WIN_Y + 50))
# done
# hyprctl dispatch moveactive $X $Y
# moveactive
#
# movewindowpixel
#
#

# #!/bin/sh
#
# # Get the position of the currently active window
# NEWWIN=$(hyprctl activewindow | grep "at: ")
# NEW_WIN_X=$(echo "$NEWWIN" | awk '{print $2}' | cut -d ',' -f 1)
# NEW_WIN_Y=$(echo "$NEWWIN" | awk '{print $2}' | cut -d ',' -f 2)
#
# # Get the positions of other windows in workspace 3
# WIN=$(hyprctl clients | grep -B 2 "workspace: 3" | grep "at: " | sort -r)
#
# # Function to check if the new window overlaps with existing ones
# is_overlapping() {
#   local NEW_WIN_X="$1"
#   local NEW_WIN_Y="$2"
#   # Loop through the windows' X and Y positions
#   while IFS= read -r ligne; do
#     WIN_X=$(echo "$ligne" | awk '{print $2}' | cut -d ',' -f 1)
#     WIN_Y=$(echo "$ligne" | awk '{print $2}' | cut -d ',' -f 2)
#     if [[ "$NEW_WIN_X" == "$WIN_X" && "$NEW_WIN_Y" == "$WIN_Y" ]]; then
#       return 0  # Return 0 if overlapping
#     fi
#   done <<< "$WIN"
#   return 1  # Return 1 if no overlap
# }
#
# # Launch a new terminal window (kitty) in the background
# kitty --hold &
# sleep 1
#
# # Loop to check for overlap and move the new window if necessary
# while is_overlapping "$NEW_WIN_X" "$NEW_WIN_Y"; do
#   NEW_WIN_X=$((NEW_WIN_X + 50))
#   NEW_WIN_Y=$((NEW_WIN_Y + 50))
# done
#
# # Move the active window to the new position
# hyprctl dispatch moveactive $NEW_WIN_X $NEW_WIN_Y
#

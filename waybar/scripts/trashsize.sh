#!/bin/bash

SIZE=$(du -sh ~/.trash | awk '{print $1}')
OUTPUT=$(du -h --max-depth=1 ~/.trash/ | sed 's/\/home\/muffin\/trash\///g' | sort -hr | tail -n +2)
LIST=$(echo "$TOOLTIP" | wc -l)

if (($LIST > 20 ))
then
  TOOLTIP=$(echo "$OUTPUT" | sed -z 's/\n/\\n/g' | head -n 20)
  TOOLTIP+='...'
  echo "{\"text\":\""$SIZE"\", \"tooltip\":\""$TOOLTIP"\"}"

else 
  TOOLTIP=$(echo "$OUTPUT" | sed -z 's/\n/\\n/g')
  TOOLTIP=${TOOLTIP::-2}
  echo "{\"text\":\""$SIZE"\", \"tooltip\":\""$TOOLTIP"\"}"
fi

exit 0

#!/bin/sh

output="$(checkupdates-with-aur)"
number="$(checkupdates-with-aur | wc -l)"
text="$number"

touch /tmp/update.log
echo "$output" > /tmp/update.log

if (( $number > 20 ))
then
    tooltip="$(echo "$output" | head -n 20 | sed -z 's/\n/\\n/g')"
    tooltip+='...'
    echo "{\"text\":\""$number"\", \"tooltip\":\""$tooltip"\", \"class\":\""orange"\"}"

else
    tooltip="$(echo "$output" | sed -z 's/\n/\\n/g')"
    tooltip=${tooltip::-2}
    echo "{\"text\":\""$number"\", \"tooltip\":\""$tooltip"\", \"class\":\""green"\"}"
fi

exit 0

#!/bin/env bash

preset="$(echo -e "Dark\nLight" | dmenu -c -m 0)"

[[ -z "$preset" ]] && notify-send "Nothing selected" && exit 0

if [[ "$preset" == "Light" ]]; then
	themes="$(wal --theme | awk 'NR>220 && NR<259 {print}')"
	sel="$(echo -e "$themes" | dmenu | awk '{print $2}')"
	[[ -z "$sel" ]] && echo -e "Nothing selected\n" && exit 0
	wal --theme "$sel" -l
	reload
else
	themes="$(wal --theme | awk 'NR>1 && NR<220 {print}')"
	sel="$(echo -e "$themes" | dmenu | awk '{print $2}')"
	[[ -z "$sel" ]] && echo -e "Nothing selected\n" && exit 0
	wal --theme "$sel"
	reload
fi

#!/bin/env bash

LAYOUT="$(echo -e "  Tiled Layout\n  Floating Layout\n  Monocle Layout\n  Centered Master\n  Centered Floating\n  Grid Layout\n  Bottom Stack Layout\n󰯌  Deck Layout" | dmenu -c -m 0)"

[[ $LAYOUT == "  Tiled Layout" ]] && echo 0
[[ $LAYOUT == "  Floating Layout" ]] && echo 1
[[ $LAYOUT == "  Monocle Layout" ]] && echo 2
[[ $LAYOUT == "  Centered Master" ]] && echo 3
[[ $LAYOUT == "  Centered Floating" ]] && echo 4
[[ $LAYOUT == "  Grid Layout" ]] && echo 5
[[ $LAYOUT == "  Bottom Stack Layout" ]] && echo 6
[[ $LAYOUT == "󰯌  Deck Layout" ]] && echo 7

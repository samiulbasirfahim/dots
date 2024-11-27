#!/bin/env bash

LAYOUT="$(echo -e "[]= Tiled Layout\n><> Floating Layout\n[M] Monocle Layout\n|M| Centered Master\n>M> Centered Master Floating\nHHH Grid\n[B] Bottom Stack\n[D] Deck" | dmenu -c -m 0)"

[[ $LAYOUT == "[]= Tiled Layout" ]] && echo 0
[[ $LAYOUT == "><> Floating Layout" ]] && echo 1
[[ $LAYOUT == "[M] Monocle Layout" ]] && echo 2
[[ $LAYOUT == "|M| Centered Master" ]] && echo 3
[[ $LAYOUT == ">M> Centered Master Floating" ]] && echo 4
[[ $LAYOUT == "HHH Grid" ]] && echo 5
[[ $LAYOUT == "[B] Bottom Stack" ]] && echo 6
[[ $LAYOUT == "[D] Deck" ]] && echo 7


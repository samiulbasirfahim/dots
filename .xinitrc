xrandr --output HDMI-A-0 --mode 1920x1080 --rate 100 --set TearFree on &
pipewire &
#sleep 0.5 && betterlockscreen -l blur && reload &
exec dbus-run-session dwm

#!/bin/sh

WALLPAPER_PATH="$HOME/Pictures/atoms.png"

test -f ~/.Xresources && xrdb -merge -I$HOME ~/.Xresources

setxkbmap -option caps:escape

xss-lock --transfer-sleep-lock -- slock &

xhidecursor &
dunst &
xset r rate 250 50 &

feh --no-fehbg --bg-fill ${WALLPAPER_PATH}

slstatus &
dbus-run-session dwm

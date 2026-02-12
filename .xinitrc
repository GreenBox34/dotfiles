#!/bin/sh

test -f ~/.Xresources && xrdb -merge -I$HOME ~/.Xresources

setxkbmap -option caps:escape

xss-lock --transfer-sleep-lock -- i3lock --nofork -c 000000 &
xss-lock --transfer-sleep-lock -- slock &

xhidecursor &

xset r rate 250 50

dbus-run-session ratpoison

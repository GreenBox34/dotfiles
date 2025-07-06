#!/bin/sh

test -f ~/.Xresources && xrdb -merge -I$HOME ~/.Xresources

setxkbmap -option caps:escape

xautolock -time 10 -locker slock &
xss-lock --transfer-sleep-lock -- i3lock --nofork -c 000000 &

unclutter-xfixes --fork
xset r rate 250 50

exec ratpoison

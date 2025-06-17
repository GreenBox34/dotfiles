#!/bin/bash

export GPG_TTY=$(tty)

if test "$(tty)" = "/dev/tty1" && test -f $HOME/.xinitrc; then
    startx $HOME/.xinitrc
fi

#!/bin/bash

export GPG_TTY=$(tty)
export PATH="$PATH:$HOME/.local/bin"
export EDITRO="nano"
export HISTSIZE=256
export HISTFILESIZE=256
export HISTCONTROL="erasedups:ignorespace"

export PS1='\[\e[1m\] \[\e[0m\]\$\[\e[1m\] \[\e[0;92m\]\w \[\e[91;1m\] \[\e[0m\]'

alias ls="ls --color=auto"
alias la="ls -ah  --group-directories-first --color=auto"
alias ll="ls -ahl --group-directories-first --color=auto"
alias c='clear'
alias ..="cd .."
alias mv="mv -v"
alias mkdir="mkdir -v"

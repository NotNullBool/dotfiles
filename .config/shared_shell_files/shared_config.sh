#!/bin/bash

#Exports
export EDITOR="nvim"
export VISUAL="nvim"
export PATH=/var/lib/flatpak/exports/bin/:$PATH
# [ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

#Alias
alias cat="bat --paging=never"
alias bat="bat --paging=never"
alias ls="exa"
alias la="exa -a"

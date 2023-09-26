#!/bin/bash

#Exports
export GTK_THEME=Adwaita:dark
export EDITOR="nvim"
export VISUAL="nvim"
export PATH=/var/lib/flatpak/exports/bin/:$PATH
export PATH=$HOME/.local/bin/:$PATH
export PATH=/snap/bin/:$PATH
export PATH=/home/taylor/.local/share/bob/nvim-bin:$PATH
export XDG_DATA_DIRS=/var/lib/snapd/desktop/:$XDG_DATA_DIRS

#Alias
alias cat="bat --paging=never"
alias bat="bat --paging=never"
alias ls="exa"
alias la="exa -a"
alias fd="fdfind"

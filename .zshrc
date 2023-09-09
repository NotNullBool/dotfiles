
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
unsetopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/taylor/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# start in tmux
if [[ -z "$TMUX" ]] && [ $XDG_SESSION_TYPE != "tty" ]; then
        declare session_name="main"
	tmux attach -t $session_name || exec tmux new -s $session_name
fi

source $HOME/.dotfiles/zsh_themes/zsh-syntax-highlighting.sh
for f in $HOME/.dotfiles/zsh_plugins/*; do source $f; done
source $HOME/.dotfiles/.config/shared_shell_files/shared_config.sh


ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# VI MODE CURSOR START
function zle-keymap-select () {

case $KEYMAP in

vicmd) echo -ne '\e[1 q';; # block

viins|main) echo -ne '\e[5 q';; # beam

esac

}

zle -N zle-keymap-select

zle-line-init() {

zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)

echo -ne "\e[5 q"

}

zle -N zle-line-init

echo -ne '\e[5 q' # Use beam shape cursor on startup.

preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt. 

# VI MODE CURSOR END

#fpath=(
#   $fpath
#   $HOME/.local/share/zsh/generated_man_completions
#)
#compinit # This is not necessary if it is called after this.

# Zoxide
eval "$(zoxide init zsh)"

alias cd="z"

fastfetch

# Starship
eval "$(starship init zsh)"

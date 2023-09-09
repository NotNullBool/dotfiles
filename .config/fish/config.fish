# start in tmux
if status is-interactive 
	and not set -q TMUX
	and [ $XDG_SESSION_TYPE != "tty" ]
    # Commands to run in interactive sessions can go here
	set session_name "base"
	if tmux has-session -t "$session_name" 2>/dev/null
		exec tmux attach-session -t "$session_name"
	else
		exec tmux new-session -s "$session_name"
	end
end


# remove help message
function fish_greeting
	if status is-interactive
	    # Commands to run in interactive sessions can go here
	    fastfetch
	end
end


set shared_files_dir ~/.config/shared_shell_files

# shared configs
source $shared_files_dir/shared_config.sh



#abbr
abbr cd z
abbr v nvim
abbr vi nvim
abbr vim nvim
abbr apt -- sudo apt

#set
set -U fish_user_paths $PATH:$HOME/.local/bin $fish_user_paths

# vi mode
fish_vi_key_bindings

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block

zoxide init fish | source

# start starship prompt keep at bottom!!!
#starship init fish | source
#if status is-interactive
    # Commands to run in interactive sessions can go here
#end

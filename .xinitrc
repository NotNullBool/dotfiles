#!/bin/bash

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script

if [ $(tty) == "/dev/tty1" ]
then
	xsetroot -cursor_name left_ptr
	export GTK_THEME="Dracula"
	export GTK_CURSOR_THEME="Dracula-cursors"
	export XDG_SESSION_TYPE="x11"
	xrandr --setprovideroutputsource modesetting NVIDIA-0
	xrandr --auto
	. /etc/X11/Xsession
	exec xmonad
fi

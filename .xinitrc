#!/bin/bash

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script

if [ $(tty) == "/dev/tty1" ]
then
	export GTK_THEME=Adwaita:dark
	export XDG_SESSION_TYPE="x11"
	xrandr --setprovideroutputsource modesetting NVIDIA-0
	xrandr --auto
	. /etc/X11/Xsession
	exec xmonad
fi

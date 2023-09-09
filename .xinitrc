#!/bin/bash

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script

if [ $(tty) == "/dev/tty1" ]
then
	export XDG_SESSION_TYPE="x11"
	. /etc/X11/Xsession
	exec xmonad
fi

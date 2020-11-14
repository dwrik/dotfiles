#!/bin/sh

# source default scripts in /etc/X11/xinit
# as suggested by Arch Wiki
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

. ~/.xprofile    # start other applications
exec i3          # start window manager

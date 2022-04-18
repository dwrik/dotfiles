#!/bin/sh

sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# display
wal -R                                   # restore colors
picom -b                                 # compositor
xwallpaper --stretch ~/.local/share/bg   # restore wallpaper

# tools
unclutter &                              # hides an idle mouse pointer
xset r rate 300 50                       # increase key repeat rate

# services
playerctld daemon                        # mpris daemon to control media
xss-lock -- slock &                      # screen lock broker which transfers lock to slock
dunst -config ~/.config/dunst/dunstrc &  # notification daemon

# system keyring
eval $(gnome-keyring-daemon --start)     # initialize system keyring
export SSH_AUTH_SOCK                     # export SSH variables

# status bar
dwmblocks 2>&1 > /dev/null &

# window manager
while true; do
    dwm 2>&1 > ~/dwm.log
done

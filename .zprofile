#!/bin/sh

# Zsh profile file runs on shell login.
# Environment variables are set here.

# Adds ~/.local/bin to $PATH
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/bin/statusbar"

# Set default programs
export VISUAL="nvim"
export EDITOR="nvim"
export PAGER="less"
export TERMINAL="st"
export BROWSER="brave"
export READER="zathura"
export SHELL="zsh"

# Set default directories
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Set LESS variables
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESSHISTFILE="$XDG_CACHE_HOME/less/lesshst"

# Video acceleration driver name
export LIBVA_DRIVER_NAME=iHD

# Ranger configuration
export RANGER_LOAD_DEFAULT_RC=FALSE

# DPI for 1080p 14 inch laptop screen
# export GDK_DPI_SCALE=1.25

# Automatically startx if logged-in in tty1
if [ "$(tty)" = "/dev/tty1" ]
then
	exec startx
fi

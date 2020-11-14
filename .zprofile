#!/usr/bin/zsh

# Zsh profile file runs on shell login.
# Environment variables are set here.

# Adds ~/Scripts to $PATH
export PATH="$PATH:$HOME/Scripts"

# Set default programs
export VISUAL="nvim"
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
export READER="zathura"
export SHELL="zsh"

# Set default directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Set other environment variables
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export RANGER_LOAD_DEFAULT_RC=FALSE
export LIBVA_DRIVER_NAME=iHD
export GDK_DPI_SCALE=1.25

# xdg base dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# java
export JAVA_HOME=$(/usr/libexec/java_home -v 23)
export JDK_HOME=$JAVA_HOME
export PATH="$JAVA_HOME/bin:$PATH"

# default programs
export VISUAL="vim"
export EDITOR="vim"
export PAGER="less"
export TERMINAL="wezterm"

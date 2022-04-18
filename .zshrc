# History file settings
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=5000
SAVEHIST=5000

# Options
setopt appendhistory      # append history list to history file
setopt sharehistory       # import new commands from history in other session
setopt histignorespace    # remove entries in history that starts with space
setopt histignorealldups  # remove duplicate entries from history
setopt completealiases    # Tab completion for aliases
setopt autocd             # cd into typed directory

unsetopt beep             # Disable beep sound
stty stop undef           # Disable ctrl-s to freeze terminal

# Vi mode
bindkey -v

autoload -Uz compinit                                             # Initialize completion system
zstyle ':completion::complete:*' menu select gain-privileges 1    # Enable for sudo commands
zmodload zsh/complist
compinit -d ~/.cache/zsh/zcompdump                                # Change completion file location
_comp_options+=(globdots)                                         # Include hidden files in completion

# Use vim keys in completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# This is a shell function to automatically change the current working
# directory to the last visited one after ranger quits. Either put it into your
# .zshrc/.bashrc/etc or source this file from your shell configuration.
# To undo the effect of this function, you can type "cd -" to return to the
# original directory.
ranger_cd() {
    temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
    ranger --choosedir="$temp_file" -- "${@:-$PWD}"
    if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
        cd -- "$chosen_dir"
    fi
    rm -f -- "$temp_file"
}

# Set pywal colors (messes up st alpha)
# ZLS_COLORS=''
# (cat ~/.cache/wal/sequences &)

# Aliases
alias l="lsd"
alias ls="lsd"
alias la="lsd -a"
alias ll="lsd -l"
alias lla="lsd -la"
alias ip="ip -color=auto"
alias vim="nvim"
alias sudo="sudo "
alias nmtui="sudo nmtui"
alias ranger="ranger_cd"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias weather="curl https://wttr.in/"

PROMPT='%B%F{cyan}[%f%F{green}%n%f@%F{magenta}%M%f %F{blue}%1~%f%F{cyan}]%f%#%b '    # Left prompt
RPROMPT='[%F{yellow}%?%f]'                                                           # Right prompt

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh    # load syntax highlighting

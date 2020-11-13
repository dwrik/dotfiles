# History file settings
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=5000
SAVEHIST=5000

unsetopt beep    # Disable beep sound
setopt autocd    # Automatically cd into typed directory
stty stop undef  # Disable ctrl-s to freeze terminal

# vi mode
bindkey -v

# Auto Completion using Tab
autoload -Uz compinit
zstyle ':completion::complete:*' menu select gain-privileges 1    # auto completion for sudo commands
zmodload zsh/complist
compinit -d ~/.cache/zsh/zcompdump
_comp_options+=(globdots)    																			# Include hidden files

# Use vim keys in tab completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Set colors
ZLS_COLORS=''
(cat ~/.cache/wal/sequences &)

# Aliases
alias vim="nvim"
alias ls="lsd"
alias l="lsd"
alias la="lsd -a"
alias ll="lsd -l"
alias lla="lsd -la"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ip="ip -color=auto"
alias weather="curl https://wttr.in/"

PROMPT='%B%F{cyan}[%f%F{green}%n%f@%F{magenta}%M%f %F{blue}%1~%f%F{cyan}]%f%#%b '    # Left prompt
RPROMPT='[%F{yellow}%?%f]'                                                           # Right prompt

# Tab completion for aliases
setopt COMPLETE_ALIASES

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh    # load syntax highlighting
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh            # load fish-like auto suggestions

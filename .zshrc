# History file settings
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=5000
SAVEHIST=5000

setopt autocd              # cd into typed directory
setopt COMPLETE_ALIASES    # Tab completion for aliases

unsetopt beep              # Disable beep sound
stty stop undef            # Disable ctrl-s to freeze terminal

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

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh    # load syntax highlighting
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh            # load fish-like auto suggestions

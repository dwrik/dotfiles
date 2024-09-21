###################
# command history #
###################

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory     # append to history file
setopt sharehistory      # import history from other sessions
setopt histignorespace   # remove history entries that starts with space
setopt histignorealldups # remove duplicate entries from history

################
# misc options #
################

bindkey -v               # enable vim mode
unsetopt beep            # disable beep sound
setopt autocd            # cd into typed directory
setopt completealiases   # tab completion for aliases
stty stop undef          # disable ctrl-s to freeze terminal

#####################
# completion system #
#####################

# initialize
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi

# enable for sudo commands
zstyle ':completion::complete:*' menu select gain-privileges 1

# include hidden files
_comp_options+=(globdots)

# vim keys for navigating completion menu
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

###########
# aliases #
###########

alias l="ls"
alias ls="ls"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias notes="vim ~/Notes"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias weather="curl https://wttr.in/"

##########
# prompt #
##########

PROMPT="%1~ > "
RPROMPT="[$?]"

############################################
# syntax highlighting (always keep at end) #
############################################

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


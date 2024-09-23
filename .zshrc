###################
# command history #
###################

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

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
    fpath=(/opt/homebrew/share/zsh/{completions,site-functions} $fpath)
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
alias nnn='nnn -edioAR'
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias weather="curl https://wttr.in/"

##########
# prompt #
##########

PROMPT="%1~ > "
RPROMPT="[$?]"

##############
# app config #
##############

source <(fzf --zsh)
export PATH="${PATH}:${HOME}/Scripts"
export FZF_CTRL_T_OPTS="--walker-skip .git,.vim,node_modules,target,Applications,Library,Public,Postman,.Trash"
export FZF_ALT_C_OPTS="--walker-skip .git,.vim,node_modules,target,Applications,Library,Public,Postman,.Trash --preview 'tree -C {}'"
export FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore -g '!{**/node_modules/**,**/.git/**,**/.DS_Store,.zsh_sessions,.vim,.android,.cargo,.m2,.npm,.rustup,.vscode,go,Applications,Library,Public,Postman,Pictures,Music,Movies,Videos,.Trash}'"

############################################
# syntax highlighting (always keep at end) #
############################################

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


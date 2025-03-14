###################
# command history #
###################

export HISTFILE="$XDG_DATA_HOME/.zsh_history"
export HISTSIZE=5000
export SAVEHIST=5000

setopt appendhistory     # append to history file
setopt sharehistory      # import history from other sessions
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

# ctrl + vim keys for navigating completion menu
zmodload zsh/complist
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

###########
# aliases #
###########

alias l="ls --color=auto"
alias ls="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -l --color=auto"
alias lla="ls -la --color=auto"
alias nnn='nnn -edioAR'
alias notes="vim ~/Notes/"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias weather="curl https://wttr.in/"

##########
# prompt #
##########

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

##############
# app config #
##############

# custom scripts
export PATH="$HOME/Scripts:$PATH"

# fzf shell integration options
export FZF_CTRL_T_COMMAND=
export FZF_CTRL_R_OPTS="--layout=reverse"
export FZF_ALT_C_OPTS="--walker-skip .git,.m2,.npm,.android,.cache,vim/plugged,venv,node_modules,target,Applications,Library,Photos\ Library.photoslibrary,Public,Postman,.Trash --preview 'tree -C {}'"
# enable fzf shell integration (ctrl-r, alt-c)
source <(fzf --zsh)
# option-c for alt-c binding
bindkey "ç" fzf-cd-widget
# run below command in vim to generate FZF colors from the
# current vim colorscheme and then add the generated line here
# :call append('$', printf('export FZF_DEFAULT_OPTS="%s"', matchstr(fzf#wrap().options, "--color[^']*")))
export FZF_DEFAULT_OPTS="--border=rounded --no-scrollbar --color=bg+:#3B4252,bg:#2E3440,spinner:#81A1C1,hl:#616E88,fg:#D8DEE9,header:#616E88,info:#81A1C1,pointer:#81A1C1,marker:#81A1C1,fg+:#D8DEE9,prompt:#81A1C1,hl+:#81A1C1"
# command that fzf runs to filter files
export FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore -g '!{**/node_modules/**,**/.git/**,**/.DS_Store,**/.zsh_sessions/**,**/.config/alacritty/themes/**,**/.config/coc/**,**/vim/plugged/**,**/venv/**,.cache,.local,.android,.cargo,.m2,.npm,.rustup,.vscode,go,Applications,Library,Public,Postman,Pictures,Music,Movies,Videos,.Trash}'"

############################################
# syntax highlighting (always keep at end) #
############################################

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

######################
# p10k custom prompt #
######################

# to customize run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

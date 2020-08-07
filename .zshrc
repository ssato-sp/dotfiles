export DOTFILES_ROOT="$HOME/dotfiles"
export PYENV_ROOT="$DOTFILES_ROOT/.python_venv/.pyenv"
export XDG_CONFIG_HOME="$DOTFILES_ROOT/.config"
export XDG_CACHE_HOME="$DOTFILES_ROOT/.cache"                   
export XDG_DATA_HOME="$DOTFILES_ROOT/.data"

setopt histignorealldups

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

autoload -Uz colors
colors

autoload -Uz compinit
compinit

autoload -Uz vcs_info

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls --color=auto"
alias gls="gls --color"

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt auto_cd


# prompt
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

zstyle ':vcs_info:*' formats '(%s)[%F{green}%b%f]'
zstyle ':vcs_info:*' actionformats '(%s)[%F{green}%b%f(%F{red}%a%f)]'

setopt prompt_subst
precmd() { vcs_info }

RPROMPT='${vcs_info_msg_0_}'

# alias

alias relogin='exec $SHELL -l'
alias python3=python3.8
alias vim=nvim

# peco
function peco-select-history() {
  BUFFER=$(\history -n 1 | tac | peco)
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"

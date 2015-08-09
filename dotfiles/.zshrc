export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/:$PATH"
export PATH="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/:$PATH"
export PATH=$PATH:/usr/local/share/python
eval "$(rbenv init -)"

# oracle
export DYLD_LIBRARY_PATH=~/opt/oracle/instantclient_11_2
export ORACLE_HOME=/Users/yonda/opt/oracle/instantclient_11_2
export TNS_ADMIN=$ORACLE_HOME/network/admin/tnsnames.ora
export ORACLE_SID=BIZCARD
export NLS_LANG=Japanese_Japan.AL32UTF8

# env

export EDITOR=vim

# aliases
alias ls="ls -FG"
alias la='ls -al'
alias b='bundle'
alias bo='bundle open'
alias bc='bundle console'
alias be='bundle exec'
alias bi='bundle install'
alias bo='bundle open'
alias bu='bundle update'
alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'
alias g='git'
alias gs='git st'
alias gl='git lo'
alias gh='git hf'

alias dd='pretty-diff'
alias show='git se'

alias va='vagrant'

# HISTFILE
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# bindkey
bindkey -e

# prompt
setopt prompt_subst
autoload colors; colors

autoload -Uz colors
colors
autoload -Uz add-zsh-hook

# go

export GOPATH=$HOME/.go
export PATH=$PATH:$HOME/.go/bin

function p() { peco | while read LINE; do $@ $LINE; done }

## alias
alias e='ghq list -p | p cd'
alias en='ghq list -p | p cd; show'
alias c='g br | peco | xargs git checkout'

# for vcs_info
function _precmd_vcs_info() {
  LANG=en_US.UTF-8 vcs_info
}
add-zsh-hook precmd _precmd_vcs_info
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats "%b" "%s"
zstyle ':vcs_info:*' actionformats "%b|%a" "%s"
# 大文字小文字を区別しない
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

function vcs_info_for_git() {
  VCS_GIT_PROMPT="${vcs_info_msg_0_}"
  VCS_GIT_PROMPT_CLEAN="%{${fg[green]}%}"
  VCS_GIT_PROMPT_DIRTY="%{${fg[yellow]}%}"

  VCS_GIT_PROMPT_ADDED="%{${fg[cyan]}%}A%{${reset_color}%}"
  VCS_GIT_PROMPT_MODIFIED="%{${fg[yellow]}%}M%{${reset_color}%}"
  VCS_GIT_PROMPT_DELETED="%{${fg[red]}%}D%{${reset_color}%}"
  VCS_GIT_PROMPT_RENAMED="%{${fg[blue]}%}R%{${reset_color}%}"
  VCS_GIT_PROMPT_UNMERGED="%{${fg[magenta]}%}U%{${reset_color}%}"
  VCS_GIT_PROMPT_UNTRACKED="%{${fg[red]}%}?%{${reset_color}%}"

  INDEX=$(git status --porcelain 2> /dev/null)
  if [[ -z "$INDEX" ]];then
    STATUS="${VCS_GIT_PROMPT_CLEAN}${VCS_GIT_PROMPT}%{${reset_color}%}"
  else
    STATUS=" ${VCS_GIT_PROMPT_DIRTY}${VCS_GIT_PROMPT}%{${reset_color}%}"
    if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_UNMERGED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^R ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_RENAMED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_DELETED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_UNTRACKED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_MODIFIED$STATUS"
    fi
    if $(echo "$INDEX" | grep '^A ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_ADDED$STATUS"
    elif $(echo "$INDEX" | grep '^M ' &> /dev/null); then
      STATUS="$VCS_GIT_PROMPT_ADDED$STATUS"
    fi
  fi
  echo "${STATUS}"
}

function vcs_info_with_color() {
  VCS_PROMPT_PREFIX="%{${fg[green]}%}[%{${reset_color}%}"
  VCS_PROMPT_SUFFIX="%{${fg[green]}%}]%{${reset_color}%}"

  VCS_NOT_GIT_PROMPT="%{${fg[green]}%}${vcs_info_msg_0_}%{${reset_color}%}"

  if [[ -n "${vcs_info_msg_0_}" ]]; then
    if [[ "${vcs_info_msg_1_}" = "git" ]]; then
      STATUS=$(vcs_info_for_git)
    else
      STATUS=${VCS_NOT_GIT_PROMPT}
    fi
    echo " ${VCS_PROMPT_PREFIX}${STATUS}${VCS_PROMPT_SUFFIX}"
  fi
}

function git(){hub "$@"}

PROMPT=$'%{$fg[red]%}@%n %{$fg[cyan]%}%~ $(vcs_info_with_color)   \n %{${fg[yellow]}%}$%{${reset_color}%} '
RPROMPT=''

fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

autoload -U compinit
compinit -u

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
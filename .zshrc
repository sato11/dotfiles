autoload -U compinit && compinit
autoload -Uz colors && colors
autoload predict-on && predict-on

## import aliases
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

source $HOME/zsh-git-prompt/zshrc.sh

PROMPT='( %{$fg[blue]%}%~%{$reset_color%} ) $(git_super_status)
%# '
RPROMPT='[%{$fg[yellow]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}]'

HISTFILE=~/.zsh_historyx
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed

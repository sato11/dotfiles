## import aliases
source ~/.aliases

## git-cli-configuration
source ~/dotfiles/git-completion.bash
source ~/dotfiles/git-prompt.sh
__git_complete g __git_main # apply completion to alias

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto
export PS1='\[\033[32m\]\u@\h\[\033[00m\]: \[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\] $ '

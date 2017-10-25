# Command
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'
alias lal='la -al'

# Rails
alias be='bundle exec'
alias r='bin/rails'
alias rs4='-p 4000'
alias rs5='-p 5000'
alias rake='bin/rake'
alias rspec='bin/rspec'

alias html2slim='for i in app/views/**/*.erb; do erb2slim $i ${i%erb}slim && rm $i; done'

## git-cli-configuration
alias g='git'
source $HOME/.git-completion.bash
source $HOME/.git-prompt.sh
__git_complete g __git_main # apply completion to alias

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto
export PS1='\[\033[32m\]\u@\h\[\033[00m\]: \[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\] $ '

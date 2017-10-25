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

# git
alias g='git'

## git-cli-configuration
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]: \[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\] $ '

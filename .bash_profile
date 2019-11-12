# .bash_profile
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [ $(which aws_completer) > /dev/null ]; then
    complete -C $(which aws_completer) aws
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH=$HOME/.nodebrew/current/bin:$PATH

export CPLUS_INCLUDE_PATH=/usr/local/include

export GOROOT=$(brew --prefix go)/libexec
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

export ELASTICPATH=/usr/local/opt/elasticsearch/libexec/bin
export PATH=$PATH:$ELASTICPATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$PATH:$HOME/.yarn/bin"
export PGDATA=/usr/local/var/postgres

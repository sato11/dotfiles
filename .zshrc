export ZSH=$HOME/dotfiles/ohmyzsh

ZSH_THEME="agnoster"
plugins=(
  aws
  bundler
  docker
  docker-compose
  git
  kubectl
  osx
  rake
  rbenv
  ruby
)

source ~/.aliases
source $ZSH/oh-my-zsh.sh

# https://github.com/agnoster/agnoster-zsh-theme/issues/39#issuecomment-307338817
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    # prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

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

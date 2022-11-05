if [ ! -d $HOME/ohmyzsh ]; then
  git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/ohmyzsh
fi

export ZSH=$HOME/ohmyzsh
export ZSH_DISABLE_COMPFIX="true"
export PATH=$PATH:$HOME/bin

if [ ! -f $ZSH/custom/themes/passion.zsh-theme ]; then
  curl -o $ZSH/custom/themes/passion.zsh-theme \
    -O https://raw.githubusercontent.com/ChesterYue/ohmyzsh-theme-passion/master/passion.zsh-theme
fi

ZSH_THEME="passion"
plugins=(
  aws
  bundler
  docker
  docker-compose
  fzf
  git
  gh
  kubectl
  macos
  rake
  rbenv
  ruby
)

source ~/.aliases
source $ZSH/oh-my-zsh.sh

bindkey '^]' peco-src
function peco-src() {
  local src=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$src" ]; then
    BUFFER="cd $src"
    zle accept-line
  fi
  zle -R -c
}
zle -N peco-src

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

export CPLUS_INCLUDE_PATH=/usr/local/include

export GOROOT=$(brew --prefix go)/libexec
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

export ELASTICPATH=/usr/local/opt/elasticsearch/libexec/bin
export PATH=$PATH:$ELASTICPATH
export PATH="$PATH:$HOME/.yarn/bin"
export PGDATA=/usr/local/var/postgres

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

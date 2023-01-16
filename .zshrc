if [ ! -d $HOME/ohmyzsh ]; then
  git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/ohmyzsh
fi

if [ ! -d $HOME/.asdf ]; then
  git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.10.2
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
  asdf
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

export CPLUS_INCLUDE_PATH=/usr/local/include

export GOROOT=$(asdf where golang)/go
export PATH=$PATH:$GOROOT/bin

export ELASTICPATH=/usr/local/opt/elasticsearch/libexec/bin
export PATH=$PATH:$ELASTICPATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

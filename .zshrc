if [ ! -d $HOME/ohmyzsh ]; then
  git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/ohmyzsh
fi

if [ ! -d $HOME/.asdf ]; then
  git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.14.0
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
source ~/.asdf/plugins/golang/set-env.zsh

# https://github.com/ohmyzsh/ohmyzsh?tab=readme-ov-file#disable-async-git-prompt
# https://github.com/ohmyzsh/ohmyzsh/issues/12328#issuecomment-2043492331
zstyle ':omz:alpha:lib:git' async-prompt no
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

export ASDF_GOLANG_MOD_VERSION_ENABLED=false
export CPLUS_INCLUDE_PATH=/usr/local/include
export ELASTICPATH=/usr/local/opt/elasticsearch/libexec/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$ELASTICPATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

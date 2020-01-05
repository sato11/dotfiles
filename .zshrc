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

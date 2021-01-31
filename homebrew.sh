# check if homebrew is installed.
# todo: install when necessary.
which brew > /dev/null || (echo 'homebrew is not installed. exiting.' && exit 1)

PACKAGES=(
  awscli
  gcc
  ghq
  git
  git-flow
  git-secrets
  go
  jq
  nodebrew
  peco
  rbenv
  ruby-build
  tmux
  yarn
)

for PACKAGE in "${PACKAGES[@]}"; do
  brew list $PACKAGE || brew install $PACKAGE
done

git secrets --register-aws --global
git secrets --install ~/.git-templates/git-secrets
git config --global init.templatedir '~/.git-templates/git-secrets'

CASKS=(
  1password
  alfred
  aws-vault
  docker
  evernote
  flux
  iterm2
  skitch
  slack
  visual-studio-code
  workflowy
)

for CASK in "${CASKS[@]}"; do
  if [[ $(brew list --cask $CASK) > /dev/null ]]; then
    echo "$CASK is installed."
  else
    brew install --cask $CASK
  fi
done

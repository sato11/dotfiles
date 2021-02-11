if [[ ! $(which brew) > /dev/null ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

PACKAGES=(
  awscli
  gcc
  ghq
  git
  git-flow
  git-secrets
  go
  hub
  jq
  nodenv
  peco
  rbenv
  ruby-build
  tmux
  yarn
)

for PACKAGE in "${PACKAGES[@]}"; do
  if [[ $(brew list $PACKAGE) > /dev/null ]]; then
    echo "$PACKAGE is installed."
  else
    brew install $PACKAGE
  fi
done

git secrets --register-aws --global
git secrets --install ~/.git-templates/git-secrets
git config --global init.templatedir '~/.git-templates/git-secrets'

CASKS=(
  1password
  alfred
  aws-vault
  bettertouchtool
  docker
  evernote
  flux
  iterm2
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

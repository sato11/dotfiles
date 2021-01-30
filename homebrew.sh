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
  jq
  nodebrew
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

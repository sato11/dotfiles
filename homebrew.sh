# check if homebrew is installed.
# todo: install when necessary.
which brew > /dev/null || (echo 'homebrew is not installed. exiting.' && exit 1)

PACKAGES=(
  awscli
  gcc
  git
  git-flow
  git-secrets
  go
  jq
  nodebrew
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

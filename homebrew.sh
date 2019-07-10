# check if homebrew is installed.
# todo: install when necessary.
which brew > /dev/null || (echo 'homebrew is not installed. exiting.' && exit 1)

PACKAGES=(
  awscli
  gcc
  git
  git-flow
  jq
  nodebrew
  rbenv
  ruby-build
  yarn
)

for PACKAGE in "${PACKAGES[@]}"; do
  brew list $PACKAGE || brew install $PACKAGE
done

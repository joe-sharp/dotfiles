#!/usr/bin/env bash
source 'scripts/lib/is_installed.sh'

function brew_install {
  if ! is_installed "${2:-$1}"; then
    brew install "$1"
  fi
}

if [[ ! $OSTYPE == "darwin"* ]]; then
  echo 'Not installing anything via brew since it is Mac only...'
  exit 0
elif eval "$(which brew &> /dev/null)"; then
  echo 'Not installing brew since it is already installed...'
else
  echo 'Installing brew...'
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew update
  brew install coreutils
fi

brew_install bat
brew_install exercism
brew_install fzf
brew_install gh
brew_install neofetch
brew_install ripgrep rg
brew_install shfmt
brew_install thefuck
brew_install yamllint

#!/usr/bin/env bash

function add_symlink {
  if [ -L "$HOME/$1" ]; then
    echo "$1 is already linked..."
  else
    rsync --no-dirs --no-links "$HOME/$1" "$HOME/$1.bak" 2> /dev/null
    ln -wvsf "$PWD/$2" "$HOME/$1"
  fi
}

if [ ! -d ~/.config ]; then
  mkdir ~/.config
fi

add_symlink .config/gh       gh
add_symlink .config/neofetch neofetch
add_symlink .gitignore       git/gitignore
add_symlink .pryrc           pryrc
add_symlink .vim             vim
add_symlink .zshenv          zshenv
add_symlink .zshrc           zshrc

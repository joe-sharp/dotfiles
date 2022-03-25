#!/usr/bin/env bash

if eval "$(defaults read com.googlecode.iterm2.plist PrefsCustomFolder &> /dev/null)"; then
  echo 'iTerm2 appears to already be configured...'
else
  echo 'Configuring iTerm2...'
  defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$PWD/iterm"
  defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
  echo 'Copying font...'
  cp Sauce\ Code\ Pro\ Nerd\ Font\ Complete.ttf ~/Library/Fonts/
fi

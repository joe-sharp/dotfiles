#!/usr/bin/env bash


defaults read com.googlecode.iterm2.plist PrefsCustomFolder &> /dev/null

if [ $? -ne 0 ]; then
  echo 'Configuring iTerm2...'
  defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dev/dotfiles/iterm"
  defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
  echo 'Copying font...'
  cp Sauce\ Code\ Pro\ Nerd\ Font\ Complete.ttf ~/Library/Fonts/
else
  echo 'iTerm2 appears to already be configured...'
fi

exit 0

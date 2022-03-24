#!/usr/bin/env bash


if [[ $OSTYPE == "darwin"* ]]; then
  ls /Applications/iTerm.app &> /dev/null

  if [ $? -ne 0 ]; then
    echo 'Installing iTerm2...'
    curl -L https://iterm2.com/downloads/stable/latest --output iTerm2.zip
    unzip iTerm2.zip
    rm iTerm2.zip
    mv iTerm.app /Applications/iTerm.app
    bash 'scripts/configure/iterm.sh'
  else
    echo 'Not installing iTerm2 since it is already installed...'
  fi
else
  echo 'Not installing iTerm2 since it is Mac only...'
fi

exit 0

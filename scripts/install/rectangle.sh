#!/usr/bin/env bash

if [[ ! $OSTYPE == "darwin"* ]]; then
  echo 'Not installing Rectangle since it is Mac only...'
elif $(ls /Application/Rectangle.app &> /dev/null); then
  echo 'Not installing Rectangle since it is already installed...'
else
  echo 'Installing Rectangle...'
  brew install --cask rectangle
fi

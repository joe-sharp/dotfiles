#!/usr/bin/env bash

if $(ls /usr/local/bin/antigen.zsh &> /dev/null); then
  echo 'Not installing antigen since it is already installed...'
else
  echo 'Installing antigen...'
  curl -L git.io/antigen > /usr/local/bin/antigen.zsh
fi

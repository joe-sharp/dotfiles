#!/usr/bin/env bash
source 'scripts/install/is_installed.sh'

ls /usr/local/bin/antigen.zsh &> /dev/null
if [ $? -ne 0 ]; then
  echo 'Installing antigen...'
  curl -L git.io/antigen > /usr/local/bin/antigen.zsh
else
  echo 'Not installing antigen since it is already installed...'
fi

exit 0

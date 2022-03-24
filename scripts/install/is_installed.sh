#!/usr/bin/env bash

function is_installed {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}"
    return 1
  else
    echo "Already installed: ${1}"
    return 0
  fi
}

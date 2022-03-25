#!/usr/bin/env bash

function is_installed {
  if eval "$(which "$1" &> /dev/null)"; then
    echo "Already installed: ${1}"
    return 0
  else
    echo "Installing: ${1}"
    return 1
  fi
}

#!/bin/bash

function config {
   /usr/bin/git --git-dir=$CONFIG_GIT_DIR --work-tree=$HOME $@
}

REPO_URL='git@github.com:james7132/.dotfiles.git'
CONFIG_GIT_DIR="$HOME/.config/.cfg"

# Clone the repo as a bare repo
if [ -d $CONFIG_GIT_DIR ]; then
  rm -rf $CONFIG_GIT_DIR
fi
git clone --bare $REPO_URL $CONFIG_GIT_DIR

# Checkout files
config config --local status.showUntrackedFiles no
config reset --hard
config checkout
config submodule update --init --recursive

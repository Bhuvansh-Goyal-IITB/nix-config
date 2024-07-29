#!/bin/env bash

if [[ -z $(git config --global user.name) ]]; then
  read -r -p "Enter your git name:" GIT_NAME
  git config --global user.name "$GIT_NAME"
fi

if [[ -z $(git config --global user.email) ]]; then
  read -r -p "Enter your git email:" GIT_EMAIL
  git config --global user.email "$GIT_EMAIL"
fi

GEN_SSH='y'
if [ -e "$HOME/.ssh/id_ed25519.pub" ]; then
  read -r -p "A ssh key already exists do you want to override it? (y/n)" GEN_SSH
fi

if [[ $GEN_SSH == 'y' ]]; then
  ssh-keygen -t ed25519 -C "$GIT_EMAIL"
  clip.exe < ~/.ssh/id_ed25519.pub
  echo "Paste the ssh copied to the clipboard in you GITHUB account"
fi

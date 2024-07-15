#!/bin/env bash

if [[ -z $(nix profile list) ]]; then
	nix profile install .#systemPackages
else
	nix profile upgrade systemPackages
fi

if [[ $SHELL != *"zsh" ]]; then
	which zsh | sudo tee -a /etc/shells
	chsh -s "$(which zsh)"
fi

read -r -p "Do you want to backup your config file (y/n):" BACKUP
if [[ $BACKUP == "y" ]]; then
	mv ~/.config ~/.config.bak
else 
	rm -rf ~/.config 
	rm -rf ~/.config.bak
fi

stow config-files -t ~

if [[ -z $(git config --global user.name) ]]; then
	read -r -p "Enter your git name:" GIT_NAME 
	git config --global user.name "$GIT_NAME"

	read -r -p "Enter your git email:" GIT_EMAIL
	git config --global user.email "$GIT_EMAIL"
fi



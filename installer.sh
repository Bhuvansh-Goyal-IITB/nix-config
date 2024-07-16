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


if [[ "$(readlink ~/.config)" != *"/config-files/.config" ]]; then
	read -r -p "Do you want to backup your config file (y/n):" BACKUP
	if [[ $BACKUP == "y" ]]; then
		mv ~/.config ~/.config.bak
	else 
		rm -rf ~/.config 
		rm -rf ~/.config.bak
	fi
fi

stow --adopt config-files -t ~
git reset --hard

if [[ -z $(git config --global user.name) ]]; then
	read -r -p "Do you want to setup git (y/n):" GIT_SETUP
	if [[ $GIT_SETUP == "y" ]]; then
		read -r -p "Enter your git name:" GIT_NAME
		git config --global user.name "$GIT_NAME"

		read -r -p "Enter your git email:" GIT_EMAIL
		git config --global user.email "$GIT_EMAIL"

		ssh-keygen -t ed25519 -C "$GIT_EMAIL"
		clip.exe < ~/.ssh/id_ed25519.pub
		echo "Paste the ssh copied to the clipboard in you GITHUB account"
	fi
fi

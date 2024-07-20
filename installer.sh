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

stow --adopt config-files -t ~
git reset --hard &> /dev/null

if [[ -z $(git config --global user.name) ]]; then
	read -r -p "Do you want to setup git (y/n):" GIT_SETUP
	if [[ $GIT_SETUP == "y" ]]; then
		read -r -p "Enter your git name:" GIT_NAME
		git config --global user.name "$GIT_NAME"

		read -r -p "Enter your git email:" GIT_EMAIL
		git config --global user.email "$GIT_EMAIL"

		ssh-keygen -t ed25519 -C "$GIT_EMAIL"
		echo "Here is the new ssh key for your GITHUB account"
		cat ~/.ssh/id_ed25519.pub
	fi
fi

if ! command -v alacritty &> /dev/null; then
	sudo snap install alacritty --classic
fi

if ! command -v brave-browser &> /dev/null; then
	sudo apt install curl
	sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	sudo apt update
	sudo apt install brave-browser
fi

if ! command -v gnome-extensions &> /dev/null; then
	sudo apt install gnome-shell-extensions
fi

gnome-extensions enable space-bar@luchrioh
gnome-extensions enable tactile@lundal.io

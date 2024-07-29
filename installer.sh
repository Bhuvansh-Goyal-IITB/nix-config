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

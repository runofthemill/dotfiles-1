#!/bin/sh

if command -v brew &>/dev/null; then
	brew tap | grep -q 'homebrew/cask-fonts' || brew tap homebrew/cask-fonts
	brew bundle --file="fonts/Brewfile"
else
	echo "Fonts not installed"
fi

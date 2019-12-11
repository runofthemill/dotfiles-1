#!/bin/sh

if command -v brew >/dev/null 2>&1; then
	brew tap | grep -q 'homebrew/cask-fonts' || brew tap homebrew/cask-fonts
	brew bundle
else
	echo "Fonts not installed"
fi

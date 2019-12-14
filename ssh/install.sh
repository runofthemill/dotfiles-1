#!/bin/sh
# if no ~/.ssh directory exists, create it
if [[ ! -d ~/.ssh ]]; then
	mkdir ~/.ssh
fi

# backup and symlink ssh config if necessary
if [[ -h ~/.ssh/config ]]; then
	echo "~/.ssh/config already symlinked"
elif [[ -e ~/.ssh/config ]]; then
	mv ~/.ssh/config ~/.ssh/config.backupp
	ln -s "$DOTFILES"/ssh/config ~/.ssh/config
else
	ln -s "$DOTFILES"/ssh/config ~/.ssh/config
fi

# create config.local if it doesn't exist
if [[ ! -e ~/.ssh/config.local ]]; then
	touch ~/.ssh/config.local
fi

#!/bin/sh
brew-bump() {
	brew update
	brew outdated | xargs brew fetch
	brew upgrade
	brew cleanup
}

brew-cleanup() {
	(cd "$(brew --repo)" && git prune && git gc)
	command brew cleanup
	rm -rf "$(brew --cache)"
}

if command -v brew &>/dev/null; then
	brew() {
		case "$1" in
		bump)
			brew-bump
			;;
		cleanup)
			brew-cleanup
			;;
		*)
			command brew "$@"
			;;
		esac
	}
fi

#!/bin/sh
if command -v brew &>/dev/null; then
	brew() {
		case "$1" in
		cleanup)
			brew-cleanup
			;;
		bump)
			brew-bump
			;;
		*)
			command brew "$@"
			;;
		esac
	}
fi

#!/bin/sh

if command -v composer &>/dev/null; then
	composer global require laravel/valet
else
	echo "composer not found"
fi

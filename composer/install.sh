#!/bin/sh

if command -v composer >/dev/null 2>&1; then
	composer global require laravel/valet
else
	echo "composer not found"
fi

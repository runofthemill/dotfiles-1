#!/bin/sh
# setups the auto-update
# (
# 	crontab -l | grep -v "dot_update"
# 	echo "0 */2 * * * $HOME/.dotfiles/bin/dot_update &>${TMPDIR:-/tmp}/dot_update.log"
# ) | crontab -
echo 'Not ready for autoupdate. :('

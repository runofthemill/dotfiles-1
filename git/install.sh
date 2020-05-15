#!/bin/sh

# Don't ask ssh password all the time
git config --global credential.helper osxkeychain

# better diffs
if command -v diff-so-fancy &>/dev/null; then
	git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
fi

# use vscode as mergetool
if command -v code &>/dev/null; then
	git config --global merge.tool vscode
	git config --global mergetool.vscode.cmd "code --wait $MERGED"
fi


#!/bin/sh
[ "$(uname -s)" != "Darwin" ] && exit 0
defaults write com.googlecode.iterm2 "PrefsCustomFolder" -string "$HOME/Documents/.sync/"
defaults write com.googlecode.iterm2 "LoadPrefsFromCustomFolder" -bool true

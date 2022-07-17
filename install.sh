#!/bin/sh

echo "Setting up your Mac..."

# Check for antidote install if we don't have it
[[ -e ~/.antidote ]] || git clone https://github.com/mattmc3/antidote.git ~/.antidote

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Updating Homebrew..."
# Update Homebrew recipes
brew update

echo "Tapping homebrew/bundle and installing from Brewfile..."
brew tap homebrew/bundle
brew bundle

echo "Adding Homebrew Zsh to /etc/shells..."
grep "/opt/homebrew/bin/zsh" /etc/shells &>/dev/null || sudo bash -c "echo /opt/homebrew/bin/zsh >> /etc/shells"
echo "Setting default shell to /opt/homebrew/bin/zsh"
grep "/opt/homebrew/bin/zsh" /etc/shells &>/dev/null && chsh -s /opt/homebrew/bin/zsh


# Set macOS preferences
# -# We will run this last because this will reload the shell
# -source .macos



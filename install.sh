#!/bin/sh

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installing Xcode CLI Tools..."

xcode-select --install

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Install global NPM packages
npm install --global yarn

. "$DOTFILES_DIR/npm.sh"

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Sites

# Symlink the Mackup config file to the home directory
ln -s ./.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences
# -# We will run this last because this will reload the shell
# -source .macos

echo ""
echo "Have you set up an ssh key for Git?  (y/n)"
read -r response
if [[ ! $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    echo "Enter email address for ssh key"
    read email
    ssh-keygen -t rsa -C "$email"
    #copy ssh key to clipboard
    pbcopy < ~/.ssh/id_rsa.pub
    echo "SSH key copied to clipboard"
fi

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

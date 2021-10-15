#!/bin/sh

# Probably can/should delete
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Setting up your Mac..."

echo "Installing Homebrew..."
# Check for Homebrew and install if we don't have it
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo "Updating Homebrew..."
# Update Homebrew recipes
brew update

echo "Tapping homebrew/bundle and installing from Brewfile..."
# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

echo "Adding Homebrew Zsh to /private/etc/shells..."
# Add ZSH to list of shells
grep "/usr/local/bin/zsh" /etc/shells &>/dev/null || sudo bash -c "echo /usr/local/bin/zsh >> /etc/shells"

echo "Installing global NPM packages..."
# Install global NPM packages
. npm.sh

echo "Symlinking some files..."
# Symlink .gitconfig, .gitignore_global, .mackup.cfg, .warprc, .wp-cli config
ln -s $DOTFILES_DIR/.gitconfig $HOME/.gitconfig
ln -s $DOTFILES_DIR/.gitignore_global $HOME/.gitignore_global
ln -s $DOTFILES_DIR/.mackup.cfg $HOME/.mackup.cfg # @TODO: needed???
ln -s $DOTFILES_DIR/.warprc $HOME/.warprc # @TODO: update w/ .fasd?

echo "Creating ~/Projects/ directory..."
# Create a Projects directory
mkdir $HOME/Projects

# Set macOS preferences
# -# We will run this last because this will reload the shell
# -source .macos

echo ""
echo "Do you want to create an SSH key?  (y/n)"
read -r response1
if [[ $response1 =~ ^([yY][eE][sS]|[yY])$ ]]; then
    echo "Enter the email address for the SSH key:"
    read email
    ssh-keygen -t rsa -b 4096 -C "$email"
    #copy ssh key to clipboard
    pbcopy < ~/.ssh/id_rsa.pub
    echo "SSH key copied to clipboard"
fi

#!/bin/sh
# print_error() {
#     print_in_red "   [✖] $1 $2\n"
# }

# print_error_stream() {
#     while read -r line; do
#         print_error "↳ ERROR: $line"
#     done
# }

# print_in_color() {
#     printf "%b" \
#         "$(tput setaf "$2" 2> /dev/null)" \
#         "$1" \
#         "$(tput sgr0 2> /dev/null)"
# }

# print_in_green() {
#     print_in_color "$1" 2
# }

# print_in_purple() {
#     print_in_color "$1" 5
# }

# print_in_red() {
#     print_in_color "$1" 1
# }

# print_in_yellow() {
#     print_in_color "$1" 3
# }

# print_question() {
#     print_in_yellow "   [?] $1"
# }

# print_result() {

#     if [ "$1" -eq 0 ]; then
#         print_success "$2"
#     else
#         print_error "$2"
#     fi

#     return "$1"

# }

# print_success() {
#     print_in_green "   [✔] $1\n"
# }

# print_warning() {
#     print_in_yellow "   [!] $1\n"
# }

# ##############################################################################################################
# ### XCode Command Line Tools
# #      thx https://github.com/alrra/dotfiles/blob/ff123ca9b9b/os/os_x/installs/install_xcode.sh

# if ! xcode-select --print-path &> /dev/null; then

#     # Prompt user to install the XCode Command Line Tools
#     xcode-select --install &> /dev/null

#     # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#     # Wait until the XCode Command Line Tools are installed
#     until xcode-select --print-path &> /dev/null; do
#         sleep 5
#     done

#     print_result $? 'Install XCode Command Line Tools'

#     # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#     # Point the `xcode-select` developer directory to
#     # the appropriate directory from within `Xcode.app`
#     # https://github.com/alrra/dotfiles/issues/13

#     sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
#     print_result $? 'Make "xcode-select" developer directory point to Xcode'

#     # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#     # Prompt user to agree to the terms of the Xcode license
#     # https://github.com/alrra/dotfiles/issues/10

#     sudo xcodebuild -license
#     print_result $? 'Agree with the XCode Command Line Tools licence'

# fi
# ###
# ##############################################################################################################


# Probably can/should delete
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Setting up your Mac..."

echo "Installing Homebrew..."
# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
grep "/usr/local/bin/zsh" /private/etc/shells &>/dev/null || sudo bash -c "echo /usr/local/bin/zsh >> /private/etc/shells"

echo "Installing global NPM packages..."
# Install global NPM packages
. npm.sh

echo "Symlinking some files..."
# Symlink .gitconfig, .gitignore_global, .mackup.cfg, .warprc, .wp-cli config
ln -s $DOTFILES_DIR/.gitconfig $HOME/.gitconfig
ln -s $DOTFILES_DIR/.gitignore_global $HOME/.gitignore_global
ln -s $DOTFILES_DIR/.mackup.cfg $HOME/.mackup.cfg
ln -s $DOTFILES_DIR/.warprc $HOME/.warprc
# ln -s $DOTFILES_DIR/.wp-cli/config.yml $HOME/.wp-cli/config.yml

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

echo ""
echo "Do you want to install Oh My Zsh?  (y/n)"
read -r response2
if [[ $response2 =~ ^([yY][eE][sS]|[yY])$ ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

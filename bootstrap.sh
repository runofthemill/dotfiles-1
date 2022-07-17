#!/usr/bin/env bash

export DOTFILES="$HOME/.dotfiles"

source $DOTFILES/script/helpers.sh

set -e

echo "Setting up your Mac..."

create_ssh_key() {
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
}

link_file() {
	if [ -e "$2" ]; then
		if [ "$(readlink "$2")" = "$1" ]; then
			success "Skipped $1"
			return 0
		else
			mv "$2" "$2.backup"
			success "Moved $2 to $2.backup"
		fi
	fi
	ln -sf "$1" "$2"
	success "Linked $1 to $2"
}

install_dotfiles() {
	info "Symlinking dotfiles"
	find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' -not -path '*.git*' |
		while read -r src; do
			dst="$HOME/.$(basename "${src%.*}")"
			link_file "$src" "$dst"
		done
}

run_installers() {
	info "Running installers"
	find -H "$DOTFILES" -maxdepth 3 -name 'install.sh' -not -path '*.git*' |
		while read -r installer; do
			info "${installer}..."
			sh -c "$installer"
		done
}

create_ssh_key
install_dotfiles
run_installers

# install useful key bindings and fuzzy completion
test $(which fzf) || return 0
$(brew --prefix)/opt/fzf/install

info "Registering last update"
git config --global dotfiles.lastupdate "$(date +%Y%m%d%H%M)"

success "System is ready to go!"

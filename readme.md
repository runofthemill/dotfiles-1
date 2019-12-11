# To-Do

- [ ] sort out `/bin`
- [ ] move global npm packages to /usr/local
- [ ] light version for just dev? e.g. for loaner laptop

### Apps not installed via dotfiles:

- Screenie
- Confide
- Microsoft Office

### Fonts not installed via dotfiles:

- Klavika
- Operator Mono

## A Fresh macOS Setup

### Before you re-install

First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

- Did you commit and push any changes/branches to your git repositories?
- Did you not forget any important documents in non-iCloud directories?
- Did you backup all key files? (e.g. `.vault_pass`)
- Did you save all of your work in apps which aren't synced through iCloud?
- Did you not forget to export important data from your local database?
- Did you update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`?

### Setting up your Mac

1. `sudo softwareupdate -i -a`
2. `xcode-select --install`
3. `git clone https://github.com/runofthemill/dotfiles-1 ~/.dotfiles`
4. `cd ~/.dotfiles && source install.sh`
5. `rm ~/.zshrc`
6. `ln -s ~/.dotfiles/.zshrc ~/.zshrc`
7. Restore preferences by running `mackup restore`
8. Optional: `cd ~/.dotfiles/opt && brew bundle`

Sync via Dropbox:
- iTerm 2
- Alfred
- Dash
- ST3???


### Afterwards
- Fix zsh-nvm per https://github.com/lukechilds/zsh-nvm/issues/44#issuecomment-391530182

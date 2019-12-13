# Mac

How I setup a new Mac.

## 1. Install brew

```console
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## 2. Install deps

```console
git clone https://github.com/runofthemill/mac.git ~/.mac
cd ~/.mac
brew bundle
```

## 3. Install dotfiles

```console
git clone https://github.com/runofthemill/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./script/bootstrap
zsh
```

Not so-sensible defaults:

```console
./macos/set-defaults
```

## 4. Setup SSH keys

Create a new SSH key or copy the previous one into `~/.ssh`. That should be
it.

Also fix perms:

```console
$ chmod 0600 ~/.ssh/id_rsa
```

## 5. Reboot

```console
sudo reboot
```

## 6. Profit!

:beers:

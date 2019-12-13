#!/bin/sh
alias reload!='exec "$SHELL" -l'

# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadcli="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="$(brew --prefix coreutils)/libexec/gnubin/ls -ahlF --color --group-directories-first"
alias weather="curl -4 http://wttr.in"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"

# Directories
alias dotfiles="code $HOME/.dotfiles"
# alias proj="cd $HOME/Projects"

# Vagrant
alias v="vagrant global-status --prune"
alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vssh="vagrant ssh"
alias vreload="vagrant reload"
alias vrebuild="vagrant destroy --force && vagrant up"

# brew services
alias list='brew services list'
alias start='brew services start'
alias stop='brew services stop'

# Exclude node_modules folders from Spotlight indexing
# https://github.com/yarnpkg/yarn/issues/6453
alias fix-spotlight='find . -type d -name "node_modules" -exec touch "{}/.metadata_never_index" \;'

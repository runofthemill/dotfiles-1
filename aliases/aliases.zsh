#!/usr/bin/env bash
alias letmerun='xattr -d -r com.apple.quarantine'

# Navigation
alias ..="cd .."
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias c="cd $HOME/Code"
alias cdot="cd $HOME/.dotfiles"
alias croot='cd "$(git rev-parse --show-toplevel)"'

# System
alias cp='cp -i'
alias duf="du -sh * | sort -hr"
alias dud='du -d 1 -h | sort -hr'
alias reload!='exec "$SHELL" -l'
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias watch='watch ' # quick hack to make watch work with aliases
alias mv='mv -i'

if command -v trash &>/dev/null; then
  alias rm="trash"
else
  alias rm="rm -i"
fi

# Dotfiles
alias dotfiles="$VEDITOR $HOME/.dotfiles"
alias zshrc="$VEDITOR ~/.zshrc"

# grep
alias grep="grep --color=auto"
if command -v ggrep &>/dev/null; then
  alias -g grep="ggrep --color=auto"
fi
# alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

# brew
alias b='brew'
alias bc='brew cask'
alias bs='brew services'
# brew services
alias list='brew services list'
alias start='brew services start'
alias stop='brew services stop'
alias restart='brew services restart'

# Exclude node_modules folders from Spotlight indexing
# https://github.com/yarnpkg/yarn/issues/6453
alias fix-spotlight='find . -type d -name "node_modules" -exec touch "{}/.metadata_never_index" \;'

# Random
alias weather="curl -4 http://wttr.in"
alias shrug="echo 'Â¯\_(ãƒ„)_/Â¯' | pbcopy"
alias python="python3"
alias py="python3"
alias pip="pip3"
alias venv="source venv/bin/activate"
alias ap="ansible-playbook"

#list whats inside packed file
alias -s zip="unzip -l"
alias -s rar="unrar l"
alias -s tar="tar tf"
alias -s tar.gz="echo "
alias -s ace="unace l"

# alias t='tail -f'

# # Command line head / tail shortcuts
# alias -g H='| head'
# alias -g T='| tail'
# alias -g G='| grep'
# alias -g L="| less"
# alias -g M="| most"
# alias -g LL="2>&1 | less"
# alias -g CA="2>&1 | cat -A"
# alias -g NE="2> /dev/null"
# alias -g NUL="> /dev/null 2>&1"
# alias -g P="2>&1| pygmentize -l pytb"

# alias fd='find . -type d -name'
# alias ff='find . -type f -name'

# alias h='history'
# alias hgrep="fc -El 0 | grep"
# alias help='man'
# alias p='ps -f'
# alias sortnr='sort -n -r'
# alias unexport='unset'

# Docker
alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}"' # https://docs.docker.com/engine/reference/commandline/ps/#formatting
alias dpsp='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"' # https://docs.docker.com/engine/reference/commandline/ps/#formatting
alias dc='docker compose'
alias dcu='docker compose up'
alias dcud='docker compose up -d'
alias dcd='docker compose down'
alias dcdv='docker compose down -v'

alias pubkey="more $HOME/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
alias copyssh="more $HOME/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

alias tf='terraform'

alias k='kubectl "--context=${KUBECTL_CONTEXT:-$(kubectl config current-context)}"'

alias mux='tmuxinator'

alias ppath='echo $PATH | tr : "\n"'

# alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
# alias sa='sail artisan'

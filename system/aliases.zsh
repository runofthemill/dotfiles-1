#!/bin/sh
# exa
alias l='exa'
alias ll='exa -1'
alias ls='exa -lhg --color-scale'
alias la='exa -lhga --git --color-scale'
alias lao='exa -lhFga --git -s=old --color-scale'
alias lan='exa -lhFga --git -s=new --color-scale'
alias lx='exa -lhHgUmua --git --color-scale'      # all list, aside from inode
alias lxa='exa -lhHgUmuSai@ --git --color-scale'  # all + inode + extended list
alias lt='exa --tree --level=2'                   # tree

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
if (type ggrep &>/dev/null); then
  alias grep="ggrep"
fi

alias grep="grep --color=auto"
# alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '
alias duf="du -sh * | sort -hr"
alias dud='du -d 1 -h | sort -hr'
alias reload!='exec "$SHELL" -l'
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias watch='watch ' # quick hack to make watch work with aliases

# Dotfiles
alias dot="$VEDITOR $HOME/.dotfiles"
alias dotfiles="$VEDITOR $HOME/.dotfiles"
alias zshrc="$VEDITOR ~/.zshrc"

# Vagrant
alias vg="vagrant global-status --prune"
alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vssh="vagrant ssh"
alias vreload="vagrant reload"
alias vrebuild="vagrant destroy --force && vagrant up"

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

# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# # open browser on urls
# if [[ -n "$BROWSER" ]]; then
#   _browser_fts=(htm html de org net com at cx nl se dk)
#   for ft in $_browser_fts; do alias -s $ft=$BROWSER; done
# fi

# _editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex)
# for ft in $_editor_fts; do alias -s $ft=$EDITOR; done

# if [[ -n "$XIVIEWER" ]]; then
#   _image_fts=(jpg jpeg png gif mng tiff tif xpm)
#   for ft in $_image_fts; do alias -s $ft=$XIVIEWER; done
# fi

# _media_fts=(ape avi flv m4a mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
# for ft in $_media_fts; do alias -s $ft=mplayer; done

# #read documents
# alias -s pdf=acroread
# alias -s ps=gv
# alias -s dvi=xdvi
# alias -s chm=xchm
# alias -s djvu=djview

# #list whats inside packed file
# alias -s zip="unzip -l"
# alias -s rar="unrar l"
# alias -s tar="tar tf"
# alias -s tar.gz="echo "
# alias -s ace="unace l"

root() {
  local root
  if [[ "$PWD" == *"/trellis"* ]]; then
    root=${PWD%/trellis*}
  elif [[ "$PWD" == *"/site"* ]]; then
    root=${PWD%/site*}
  elif [[ -d "$PWD/trellis" || -d "$PWD/site" ]]; then
    root=${PWD}
  fi

  echo "$root"
}

alias theme='cd $(root)/site/web/app/themes/$(wp @dev option get stylesheet | cut -d/ -f1)'
alias trellis='cd $(root)/trellis'
alias site='cd $(root)/site'

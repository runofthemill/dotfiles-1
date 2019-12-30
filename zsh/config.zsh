#!/bin/zsh
export LSCOLORS='exfxcxdxbxegedabagacad'
export CLICOLOR=true
export EXA_GRID_ROWS=4

fpath=($DOTFILES/functions $fpath)

#autoload -U "$DOTFILES"/functions/*(:t)
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
autoload -U edit-command-line

HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=10000

setopt AUTO_CD
setopt AUTO_LIST
setopt AUTO_MENU
setopt ALWAYS_TO_END
setopt CORRECT_ALL
# don't nice background tasks
setopt NO_BG_NICE
setopt NO_HUP
setopt NO_BEEP
# allow functions to have local options
setopt LOCAL_OPTIONS
# allow functions to have local traps
setopt LOCAL_TRAPS
# share history between sessions ???
setopt SHARE_HISTORY
# add timestamps to history
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
# don't record dupes in history
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt HIST_EXPIRE_DUPS_FIRST
# dont ask for confirmation in rm globs*
setopt RM_STAR_SILENT

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N edit-command-line

# fuzzy find: start to type
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search
bindkey "$terminfo[cuu1]" up-line-or-beginning-search
bindkey "$terminfo[cud1]" down-line-or-beginning-search

# backward and forward word with option+left/right
bindkey '^[^[[D' backward-word
bindkey '^[b' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[f' forward-word

# to to the beggining/end of line with fn+left/right or home/end
bindkey "${terminfo[khome]}" beginning-of-line
bindkey '^[[H' beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey '^[[F' end-of-line

# delete char with backspaces and delete
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

# delete word with ctrl+backspace
bindkey '^[[3;5~' backward-delete-word
# bindkey '^[[3~' backward-delete-word

# edit command line in $EDITOR
bindkey '^e' edit-command-line

# search history with fzf if installed, default otherwise
if test -d /usr/local/opt/fzf/shell; then
	# shellcheck disable=SC1091
	. /usr/local/opt/fzf/shell/key-bindings.zsh
else
	bindkey '^R' history-incremental-search-backward
fi

if [ $commands[fasd] ]; then # check if fasd is installed
  fasd_cache=~/.fasd-init-cache
  if [[ "$(command -v fasd)" -nt "$fasd_cache" || ! -s "$fasd_cache" ]]; then
    fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install >| "$fasd_cache"
  fi
  source "$fasd_cache"
  unset fasd_cache

  # alias v='f -e "$EDITOR"'
  # alias o='a -e xdg-open'
  # alias j='zz'
fi

### Exa settings
LSCOLORS='exfxcxdxbxegedabagacad'
CLICOLOR=true
EXA_GRID_ROWS=4

### Homebrew Settings
HOMEBREW_BUNDLE_NO_LOCK=true

### Changing Directories
setopt AUTO_CD
setopt AUTO_PUSHD
setopt CHASE_DOTS
setopt PUSHD_MINUS

### Completion
setopt ALWAYS_TO_END
setopt AUTO_MENU

### Input/Output
setopt CORRECT # try to correct spelling of commands
setopt CORRECT_ALL # try to correct spelling of args
setopt RM_STAR_SILENT # dont ask for confirmation in rm globs*

### Job Control
setopt NO_HUP

### Zle
setopt NO_BEEP

### Scripts and Functions
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps

### History
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=10000

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_LEX_WORDS
setopt HIST_NO_FUNCTIONS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???

### Prompting
setopt PROMPT_SUBST # parameter expansion, command substitution and arithmetic expansion are performed in prompts

### Keybindings
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
autoload -U edit-command-line

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N edit-command-line

# fuzzy find: start to type
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search
bindkey "$terminfo[cuu1]" up-line-or-beginning-search
bindkey "$terminfo[cud1]" down-line-or-beginning-search

# to to the beggining/end of line with fn+left/right or home/end
bindkey "${terminfo[khome]}" beginning-of-line
bindkey '^[[H' beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey '^[[F' end-of-line

# edit command line in $EDITOR
bindkey '^e' edit-command-line

# search history with fzf if installed, default otherwise
if test -d /usr/local/opt/fzf/shell; then
	. /usr/local/opt/fzf/shell/key-bindings.zsh
else
	bindkey '^R' history-incremental-search-backward
fi

TIPZ_TEXT='💡'
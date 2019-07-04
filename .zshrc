zmodload zsh/zutil
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="false"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.dotfiles/zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	zsh-nvm
	colored-man-pages
	common-aliases
	roots-aliases
	dircycle
	extract
	fasd
	forklift
	gitfast
	git-flow
	httpie
	npm
	per-directory-history
	sudo
	wp-cli
	yarn
)

# lazy-load NVM https://github.com/lukechilds/zsh-nvm#lazy-loading
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true

ZSH_DISABLE_COMPFIX=true

# Activate Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Pure theme
autoload -U promptinit; promptinit

zstyle :prompt:pure:git:branch color magenta
prompt pure

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

# Syntax highligting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Zsh autocompletions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export CGR_BIN_DIR=$HOME/bin

export PATH="/usr/local/opt/php@7.2/sbin:/usr/local/opt/php@7.2/bin:$HOME/.composer/vendor/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:/usr/local/sbin:$PATH"
eval $(thefuck --alias)

fpath=(/usr/local/share/zsh-completions $fpath)

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/jeremy/Projects/064_Gryphon/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/jeremy/Projects/064_Gryphon/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/jeremy/Projects/064_Gryphon/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/jeremy/Projects/064_Gryphon/node_modules/tabtab/.completions/sls.zsh

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/jeremy/Projects/066_Siren/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/jeremy/Projects/066_Siren/node_modules/tabtab/.completions/slss.zsh


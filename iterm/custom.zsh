#!/bin/sh
# See https://www.iterm2.com/3.3/documentation-scripting-fundamentals.html
function iterm2_print_user_vars() {
  iterm2_set_user_var nodeVersion $(set_node_version)
}

function set_node_version() {
  if command -v nvm &>/dev/null; then
    if (type _zsh_nvm_nvm &>/dev/null); then
      echo $(nvm current)
    else
      echo "unset"
    fi
  elif command -v node &>/dev/null; then
    echo "$(node -v) (system)"
  else
    echo "unset"
  fi
}

# if nvm isn't loaded, and user switches into a dir with .nvmrc, load nvm
function chpwd() {
  if command -v nvm &>/dev/null && ! (type _zsh_nvm_nvm &>/dev/null); then
    if [[ -e ".nvmrc" ]]; then
      nvm use
    fi
  fi
}

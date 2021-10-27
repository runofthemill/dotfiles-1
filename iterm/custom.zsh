#!/bin/sh
# See https://www.iterm2.com/3.3/documentation-scripting-fundamentals.html
function iterm2_print_user_vars() {
  iterm2_set_user_var nodeVersion $(set_node_version)
}

function set_node_version() {
  if command -v fnm &>/dev/null; then
    echo $(fnm current)
  elif command -v node &>/dev/null; then
    echo "$(node -v) (system)"
  else
    echo "unset"
  fi
}

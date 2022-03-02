#!/bin/sh
# See https://www.iterm2.com/3.3/documentation-scripting-fundamentals.html
function iterm2_print_user_vars() {
  iterm2_set_user_var nodeVersion $(set_node_version)
  iterm2_set_user_var
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

# if [[ -n "$ITERM_SESSION_ID" ]]; then
#     tab-color() {
#         echo -ne "\033]6;1;bg;red;brightness;$1\a"
#         echo -ne "\033]6;1;bg;green;brightness;$2\a"
#         echo -ne "\033]6;1;bg;blue;brightness;$3\a"
#     }
#     tab-red() { tab-color 255 0 0 }
#     tab-green() { tab-color 0 255 0 }
#     tab-blue() { tab-color 0 0 255 }
#     tab-reset() { echo -ne "\033]6;1;bg;*;default\a" }

#     function iterm2_tab_precmd() {
#         tab-reset
#     }

#     function iterm2_tab_preexec() {
#       # print ${=1}
#       params=()
#       for i in "${=1[@]}"; do
#           params+=($i)
#       done

#       for i in $params; do
#         echo $i
#       done

#       if [[ "${params[1]}" == "ssmt" ]]; then
#       echo "howdy"
#       fi

#         if [[ "$1" =~ "^ssh " ]]; then
#             if [[ "$1" =~ "prod" ]]; then
#                 tab-color 255 160 160
#             else
#                 tab-color 160 255 160
#             fi
#         else
#             tab-color 160 160 255
#         fi
#     }

#     autoload -U add-zsh-hook
#     add-zsh-hook precmd  iterm2_tab_precmd
#     add-zsh-hook preexec iterm2_tab_preexec
# fi

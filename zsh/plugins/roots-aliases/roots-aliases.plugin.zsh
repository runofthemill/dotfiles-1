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
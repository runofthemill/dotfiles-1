#!/bin/sh

packages=(
  get-port-cli
  ghwd
  gtop
  historie
  lambda-pure-prompt
  nodemon
  npm
  pm2
  release-it
  spot
  superstatic
  svgo
  tldr
  underscore-cli
  vtop
)

yarn global add "${packages[@]}"

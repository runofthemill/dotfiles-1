#!/bin/sh

packages=(
  get-port-cli
  ghwd
  gtop
  historie
  lambda-pure-prompt
  nodemon
  pm2
  release-it
  spot
  superstatic
  svgo
  tldr
  underscore-cli
  vtop
  yarn
)

npm install --global "${packages[@]}"

#!/bin/sh

packages=(
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
  sitespeed.io
)

yarn global add "${packages[@]}" --prefix /usr/local

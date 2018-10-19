#!/bin/sh

packages=(
  bower
  grunt
  gulp
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
  committasks
  gatsby-cli
)

yarn global add "${packages[@]}" --prefix /usr/local

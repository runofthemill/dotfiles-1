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
  npm
  ntl # may need alias ntl='nocorrect ntl' & export NTL_RUNNER=yarn/npm
)

npm install --global "${packages[@]}"

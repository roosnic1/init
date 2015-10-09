#!/bin/zsh
mkdir .files/$(hostname)

cp ~/.gitconfig .files/$(hostname)/
cp ~/.gitignore_global .files/$(hostname)/
cp ~/.zshrc .files/$(hostname)/
cp ~/.eslintrc .files/$(hostname)/
cp ~/.bash_profile .files/$(hostname)/

#Get all global node modules
npm list -global -depth=0 -json > .files/$(hostname)/global_npm.json

#Get all brew formulas
brew list > .files/$(hostname)/brews_list.txt
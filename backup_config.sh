#!/bin/zsh
cp ~/.gitconfig .files/
cp ~/.gitignore_global .files/
cp ~/.zshrc .files/
cp ~/.eslintrc .files/
cp ~/.bash_profile .files/

#Get all global node modules
npm list -global -depth=0 -json > global_npm.json

#Get all brew formulas
brew list > brews_list.txt
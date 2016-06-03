#!/bin/zsh

hname=${$(hostname)%.*}

mkdir .files/$hname

cp ~/.gitconfig .files/$hname/
cp ~/.gitignore_global .files/$hname/
cp ~/.zshrc .files/$hname/
cp ~/.eslintrc .files/$hname/
cp ~/.bash_profile .files/$hname/

#Get all global node modules
npm list -global -depth=0 -json > .files/$hname/global_npm.json

#Get all brew formulas
brew list > .files/$hname/brews_list.txt

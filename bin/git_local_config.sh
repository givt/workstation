#!/bin/bash
# (C) 2008, givt

git config user.name "Igor Tsinman"
git config user.email "igor.tsinman@gmail.com"
git config core.editor vim
git config core.excludesfile ~/.gitignore
git config color.ui true
git config format.pretty oneline
git config merge.tool vimdiff

# last one just to show
git config --list


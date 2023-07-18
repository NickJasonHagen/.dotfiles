#!/usr/bin/env bash

# Set up some dependencies and folders the neovim and vim configs need.
mkdir -p ~/.vim/tmp/undo
mkdir -p ~/.vim/tmp/backup
mkdir -p ~/.vim/tmp/swap

sudo apt install -y fd-find


#!/usr/bin/env bash

# Set up some dependencies and folders the neovim and vim configs need.
mkdir -p ~/.vim/tmp/undo
mkdir -p ~/.vim/tmp/backup
mkdir -p ~/.vim/tmp/swap

sudo apt install -y fd-find
sudo apt install -y ansible
sudo apt install -y xdotool

brew install tmux
brew install ripgrep
brew install fzf
brew install php-code-sniffer
brew install chafa
brew install jq
brew install yq

# # Shell
brew install zoxide
brew install bat
brew install exa
brew install lazygit
brew install git-delta

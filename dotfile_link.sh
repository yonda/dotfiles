#!/bin/sh
ln -sf /Users/honda/src/github.com/yonda/dotfiles/dotfiles/gitconfig ~/.gitconfig
ln -sf /Users/honda/src/github.com/yonda/dotfiles/dotfiles/tmux.conf ~/.tmux.conf
ln -sf /Users/honda/src/github.com/yonda/dotfiles/dotfiles/vimrc ~/.vimrc
ln -sf /Users/honda/src/github.com/yonda/dotfiles/dotfiles/zshrc ~/.zshrc
mkdir ~/.brewfile
ln -sf /Users/honda/src/github.com/yonda/dotfiles/dotfiles/Brewfile ~/.brewfile/Brewfile
ln -sf /Users/honda/src/github.com/yonda/dotfiles/dotfiles/gitignore ~/.gitignore
mkdir ~/.config
mkdir ~/.config/nvim
ln -sf /Users/honda/src/github.com/yonda/dotfiles/dotfiles/config/nvim/init.vim ~/.config/nvim/init.vim
ln -sf /Users/honda/src/github.com/yonda/dotfiles/dotfiles/config/nvim/dein.toml ~/.config/nvim/dein.toml
ln -sf /Users/honda/src/github.com/yonda/dotfiles/dotfiles/config/nvim/dein_lazy.toml ~/.config/nvim/dein_lazy.toml

# NOTE まだ作ってない時だけ
# touch ~/.gitconfig.private
# touch ~/.zshrc.local

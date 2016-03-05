#!/bin/bash
mkdir -p ~/.tmp/{undo,backup,swap}
mkdir -p ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/dotfiles/vim/colors ~/.vim/colors
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf


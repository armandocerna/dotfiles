#!/bin/bash
mkdir -p ~/.tmp/{undo,backup,swap}
mkdir -p ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/dotfiles/vim/colors ~/.vim/colors
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/prezto/zlogin ~/.zlogin
ln -s ~/dotfiles/prezto/zlogout ~/.zlogout
ln -s ~/dotfiles/prezto/zpreztorc ~/.zpreztorc
ln -s ~/dotfiles/prezto/zprofile ~/.zprofile
ln -s ~/dotfiles/prezto/zshenv ~/.zshenv
ln -s ~/dotfiles/prezto/zshrc ~/.zshrc

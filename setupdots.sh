#!/bin/bash
mkdir -p ~/.tmp/{undo,backup,swap}
mkdir -p ~/.vim
mkdir -p ~/.config
ln -sf ~/.vim ~/.config/nvim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/dotfiles/vim/vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vim/colors ~/.vim/colors
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/prezto/zlogin ~/.zlogin
ln -sf ~/dotfiles/prezto/zlogout ~/.zlogout
ln -sf ~/dotfiles/prezto/zpreztorc ~/.zpreztorc
ln -sf ~/dotfiles/prezto/zprofile ~/.zprofile
ln -sf ~/dotfiles/prezto/zshenv ~/.zshenv
ln -sf ~/dotfiles/prezto/zshrc ~/.zshrc

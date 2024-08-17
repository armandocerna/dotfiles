#!/bin/bash
mkdir -p ~/.config

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/tmux/tmux-theme.conf ~/.tmux-theme.conf
ln -sf ~/dotfiles/prezto/zlogin ~/.zlogin
ln -sf ~/dotfiles/prezto/zlogout ~/.zlogout
ln -sf ~/dotfiles/prezto/zpreztorc ~/.zpreztorc
ln -sf ~/dotfiles/prezto/zprofile ~/.zprofile
ln -sf ~/dotfiles/prezto/zshenv ~/.zshenv
ln -sf ~/dotfiles/prezto/zshrc ~/.zshrc
ln -sf ~/dotfiles/prezto/p10k.zsh ~/.p10k.zsh
ln -sf ~/dotfiles/prezto/aliases.sh ~/.aliases.sh
ln -sf ~/dotfiles/intellij/ideavimrc ~/.ideavimrc

# Scripts
ln -sf ~/dotfiles/scripts/tmux_battery.sh ~/bin/tmux_battery.sh

# Linux Specific things
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    mkdir -p ~/.config/fontconfig
    mkdir -p ~/.config/i3
    ln -sf ~/dotfiles/fontconfig/fonts.conf ~/.config/fontconfig/fonts.conf
    ln -sf ~/dotfiles/i3/config ~/.config/i3/config
    ln -sf ~/dotfiles/i3blocks/config ~/.i3blocks.conf
    ln -sf ~/dotfiles/xmodmap/xmodmap ~/.Xmodmap
    ln -sf ~/dotfiles/xresources/Xresources ~/.Xresources
fi

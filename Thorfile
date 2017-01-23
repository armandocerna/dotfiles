#!/usr/bin/env ruby
require thor

class Dawts < Thor
  dots = {
    "vim" => {
      "#{ENV["HOME"]}/dotfiles/vim/vimrc" => "#{ENV["HOME"]}/.vimrc",
      "#{ENV["HOME"]}/dotfiles/vim/vimrc" => "#{ENV["HOME"]}/.config/nvim/init.vim",
      "#{ENV["HOME"]}/dotfiles/vim/colors" => "#{ENV["HOME"]}/.vim/colors"
    },
    "tmux" => {
      "#{ENV["HOME"]}/dotfiles/tmux/tmux.conf" => "#{ENV["HOME"]}/.tmux.conf",
      "#{ENV["HOME"]}/dotfiles/vim/tmux-theme.conf" => "#{ENV["HOME"]}/.tmux-theme.conf"
    },
    "xresources" => {
      "#{ENV["HOME"]}/dotfiles/xresources/Xresources" => "#{ENV["HOME"]}/.Xresources"
    },
    "fonts" => {
      "#{ENV["HOME"]}/dotfiles/fontconfig/fonts.conf" => "#{ENV["HOME"]}/.config/fontconfig/fonts.conf"
    },
    "scripts" => {
      "#{ENV["HOME"]}/dotfiles/scripts/dock.rb" => "/usr/local/bin/dock.rb"
    },
    "zsh" => {
      "#{ENV["HOME"]}/dotfiles/prezto/zlogin" => "#{ENV["HOME"]}/.zlogin",
      "#{ENV["HOME"]}/dotfiles/prezto/zlogout" => "#{ENV["HOME"]}/.zlogout",
      "#{ENV["HOME"]}/dotfiles/prezto/zpreztorc" => "#{ENV["HOME"]}/.zpreztorc",
      "#{ENV["HOME"]}/dotfiles/prezto/zprofile" => "#{ENV["HOME"]}/.zprofile",
      "#{ENV["HOME"]}/dotfiles/prezto/zshenv" => "#{ENV["HOME"]}/.zshenv",
      "#{ENV["HOME"]}/dotfiles/prezto/zshrc" => "#{ENV["HOME"]}/.zshrc",
      "#{ENV["HOME"]}/dotfiles/prezto/aliases.sh" => "#{ENV["HOME"]}/.aliases.sh",
    }
  }

  desc "link APP", "symlink dotfiles for APP"
  long_desc <<-LONGDESC
    '' will symlink dotfiles in place for the requested app.
    Currently supported apps are: vim, xresouces, tmux, zsh fonts
    Ommitting app name will call all dotfiles to be symlinked
  LONGDESC
  def link(name=nil)

  end
end

Dawts.start(ARGV)

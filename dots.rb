#!/usr/bin/env ruby

dothome = "#{ENV["HOME"]}/dotfiles"
home = ENV["HOME"]
$dots = {
  :vim => {
    "#{dothome}/vim/vimrc" => "#{home}/.vimrc",
    "#{dothome}/vim/vimrc" => "#{home}/.config/nvim/init.vim",
    "#{dothome}/vim/colors" => "#{home}/.vim/colors"
  },
  :tmux => {
    "#{dothome}/tmux/tmux.conf" => "#{home}/.tmux.conf",
    "#{dothome}/vim/tmux-theme.conf" => "#{home}/.tmux-theme.conf"
  },
  :xresources => {
    "#{dothome}/xresources/Xresources" => "#{home}/.Xresources"
  },
  :fonts => {
    "#{dothome}/fontconfig/fonts.conf" => "#{home}/.config/fontconfig/fonts.conf"
  },
  :scripts => {
    "#{dothome}/scripts/dock.rb" => "/usr/local/bin/dock.rb"
  },
  :zsh => {
    "#{dothome}/prezto/zlogin" => "#{home}/.zlogin",
    "#{dothome}/prezto/zlogout" => "#{home}/.zlogout",
    "#{dothome}/prezto/zpreztorc" => "#{home}/.zpreztorc",
    "#{dothome}/prezto/zprofile" => "#{home}/.zprofile",
    "#{dothome}/prezto/zshenv" => "#{home}/.zshenv",
    "#{dothome}/prezto/zshrc" => "#{home}/.zshrc",
    "#{dothome}/prezto/aliases.sh" => "#{home}/.aliases.sh",
  }
}

module OS
  def OS.linux?
    (/linux/ =~ RUBY_PLATFORM) != nil
  end

  def OS.mac?
   (/darwin/ =~ RUBY_PLATFORM) != nil
  end
end

def link(name)
  puts $dots[name].inspect
end

if OS.linux?
  puts "Linux!"
  # puts $dots[:vim].inspect
  link(:vim)
elsif OS.mac?
  puts "Apple =("
else
  puts "Invalid Operating System"
end

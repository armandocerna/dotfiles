-- Plugin manager
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-endwise'
  use 'bling/vim-airline'
  use 'unblevable/quick-scope'
  use 'pearofducks/ansible-vim'
  use 'airblade/vim-gitgutter'
  use {'junegunn/fzf', run = './install --all'}
  use 'junegunn/fzf.vim'
  use 'wellle/targets.vim'
  use 'ntpeters/vim-better-whitespace'
  use 'nathanaelkane/vim-indent-guides'
  use 'christoomey/vim-tmux-navigator'
  use 'justinmk/vim-sneak'
  use 'dhruvasagar/vim-zoom'
  use 'fatih/vim-go'
  use 'google/vim-jsonnet'
  use 'github/copilot.vim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  -- Themes
  use 'dfxyz/CandyPaper.vim'
  use 'chriskempson/base16-vim'
  use 'tomasr/molokai'
  use 'whatyouhide/vim-gotham'
  use 'vim-airline/vim-airline-themes'
  use {'dracula/vim', as = 'dracula'}
end)

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
  use 'joerdav/templ.vim'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {
  'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',    -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',      -- Buffer completions
      'hrsh7th/cmp-path',        -- Path completions
      'hrsh7th/cmp-cmdline',     -- Cmdline completions
    }
  }
  use {
  'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }
  -- Themes
  use 'dfxyz/CandyPaper.vim'
  use 'chriskempson/base16-vim'
  use 'tomasr/molokai'
  use 'whatyouhide/vim-gotham'
  use 'vim-airline/vim-airline-themes'
  use {'dracula/vim', as = 'dracula'}
end)

-- Treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "go", "jsonnet", "json", "python", "bash", "html", "css", "javascript", "typescript", "rust", "toml", "dockerfile", "lua", "python", "ruby", "yaml"},
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    -- disable = { "c", "rust" },
    additional_vim_regex_highlighting = false,
  },
}

-- Nvim-tree
require("nvim-tree").setup()

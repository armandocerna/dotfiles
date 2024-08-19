-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Essential Vim Enhancements
  -- 'tpope/vim-fugitive',         -- Git integration
  'tpope/vim-surround',         -- Manipulate surrounding characters
  'tpope/vim-commentary',       -- Commenting utility
  'tpope/vim-repeat',           -- Enable repeat support for plugins
  'tpope/vim-unimpaired',       -- Pairs of handy bracket mappings
  'tpope/vim-endwise',          -- Automatically add `end` in Ruby, etc.
  {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
    "ibhagwan/fzf-lua",              -- optional
  },
  config = true
  },

  -- UI Enhancements
  'bling/vim-airline',          -- Status/tabline
  {
    'vim-airline/vim-airline-themes',
    lazy = false,               -- Ensure it loads immediately with vim-airline
    config = function()
      vim.g.airline_theme = 'base16'  -- Apply your preferred theme
      vim.g.airline_powerline_fonts = 1  -- Use Powerline fonts if required
      vim.g.airline_extensions = { 'tabline' }
      vim.g.airline_extensions_tabline_enabled = 1
    end,
  },
  'vim-airline/vim-airline-themes', -- Themes for vim-airline
  'lewis6991/gitsigns.nvim',     -- Git diff in the gutter
  'ntpeters/vim-better-whitespace', -- Highlight and strip trailing whitespace
  'nathanaelkane/vim-indent-guides', -- Display indent levels with guides
  'dhruvasagar/vim-zoom',       -- Zoom into splits

  -- Navigation
  'christoomey/vim-tmux-navigator', -- Seamless navigation between vim and tmux
  'justinmk/vim-sneak',         -- Jump to any location specified by two characters
  'wellle/targets.vim',         -- Additional text objects
  'unblevable/quick-scope',     -- Highlight unique characters to jump to

  -- Fuzzy Finder
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  },

  -- Code Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',    -- LSP source for nvim-cmp
      'hrsh7th/cmp-buffer',      -- Buffer completions
      'hrsh7th/cmp-path',        -- Path completions
      'hrsh7th/cmp-cmdline',     -- Cmdline completions
    }
  },

  -- Language Server Protocol (LSP)
  'williamboman/mason.nvim',    -- Manage LSP servers, linters & formatters
  'williamboman/mason-lspconfig.nvim', -- Bridge mason with lspconfig
  'neovim/nvim-lspconfig',      -- Quickstart configurations for the Nvim LSP client

  -- Language Support
  'fatih/vim-go',               -- Go development
  'google/vim-jsonnet',         -- Jsonnet support
  'joerdav/templ.vim',          -- Templating support

  -- Code Syntax Highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  -- File Explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- File icons for nvim-tree
    },
  },

  -- AI Assistant
  'github/copilot.vim',         -- GitHub Copilot for AI pair programming

  -- Themes
  'tinted-theming/base16-vim',  -- Base16 themes for vim
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
})

-- Treesitter Config
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

-- Nvim-tree Config
require("nvim-tree").setup()

-- gitsigns Config
require('gitsigns').setup()

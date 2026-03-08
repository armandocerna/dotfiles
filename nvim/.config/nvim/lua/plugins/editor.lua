return {
  -- Surround
  {
    'echasnovski/mini.surround',
    version = '*',
    opts = {},
  },

  -- Comment
  {
    'echasnovski/mini.comment',
    version = '*',
    opts = {},
  },

  -- Auto pairs
  {
    'echasnovski/mini.pairs',
    version = '*',
    opts = {},
  },

  -- File explorer
  {
    'echasnovski/mini.files',
    version = '*',
    opts = {},
  },

  -- Jump anywhere
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
      { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
    },
    opts = {},
  },

  -- Additional text objects
  'wellle/targets.vim',

  -- Repeat plugin commands with .
  'tpope/vim-repeat',

  -- Automatically add end in Ruby, etc.
  'tpope/vim-endwise',

  -- Quick-scope: highlight unique chars for f/F/t/T
  {
    'unblevable/quick-scope',
    init = function()
      vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
    end,
  },
}

return {
  -- Git signs in gutter
  {
    'lewis6991/gitsigns.nvim',
    opts = {},
  },

  -- Git interface
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'ibhagwan/fzf-lua',
    },
    config = true,
  },
}

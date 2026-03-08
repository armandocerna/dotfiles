return {
  -- Tmux integration
  'christoomey/vim-tmux-navigator',

  -- Fuzzy finder
  {
    'ibhagwan/fzf-lua',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
      return {
        files = {
          cmd = "fd --type f --hidden --exclude .git",
        },
        actions = {
          files = {
            ["default"] = require("fzf-lua.actions").file_edit,
          },
        },
      }
    end,
  },
}

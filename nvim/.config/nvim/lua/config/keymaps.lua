local map = vim.keymap.set

-- Escape
map('i', 'jj', '<Esc>')

-- FzfLua
map('n', '<leader>/', ':FzfLua grep<cr>', { desc = 'Grep' })
map('n', '<leader>f', ':FzfLua files<cr>', { desc = 'Find files' })
map('n', '<leader>gf', ':FzfLua git_files<cr>', { desc = 'Git files' })
map('n', '<leader>b', ':FzfLua buffers<cr>', { desc = 'Buffers' })
map('n', '<leader>sh', ':FzfLua help_tags<cr>', { desc = 'Help tags' })
map('n', '<leader>sd', ':FzfLua diagnostics_document<cr>', { desc = 'Diagnostics' })

-- Buffers
map('n', '<leader>bd', ':bd<cr>', { desc = 'Delete buffer' })

-- Git
map('n', '<leader>gs', ':Neogit kind=auto<cr>', { desc = 'Neogit' })

-- Toggle relative line numbers
map('n', '<leader>ln', ':set rnu!<cr>', { desc = 'Toggle relative numbers' })

-- Mini.files
map('n', '<leader>e', function() MiniFiles.open() end, { desc = 'File explorer' })

-- Reload config
map('n', '<leader>nr', ':source ~/.config/nvim/init.lua<CR>', { desc = 'Reload config' })

-- Quickfix
map('n', '<leader>a', ':cclose<CR>', { desc = 'Close quickfix' })

-- Zoom
map('n', '<leader>z', '<C-w>|<C-w>_', { desc = 'Zoom split' })
map('n', '<leader>Z', '<C-w>=', { desc = 'Restore splits' })

-- Keymappings
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>/', ':FzfLua grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>f', ':FzfLua files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gf', ':FzfLua git_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':FzfLua buffers<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dab', ':1,$bd<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gs', ':Neogit<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ws', ':StripWhitespace<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ln', ':set rnu!<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>nr', ':source ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>a', ':cclose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeOpen<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>yy', '"+yy', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>yb', ':%y+<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { noremap = true, silent = true })



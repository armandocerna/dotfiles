-- Keymappings
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>/', ':Pick grep<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>f', ':Pick files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gf', ':Pick files tool="git"<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':FzfLua buffers<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dab', ':1,$bd<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gs', ':Neogit kind=auto<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ws', ':StripWhitespace<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ln', ':set rnu!<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>mf', ':lua MiniFiles.open()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>nr', ':source ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>a', ':cclose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeOpen<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>yy', '"+yy', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>yb', ':%y+<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { noremap = true, silent = true })



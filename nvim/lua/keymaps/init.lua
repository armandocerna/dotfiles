-- Keymappings
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader><tab>', '<plug>(fzf-maps-n)', { noremap = true })
vim.api.nvim_set_keymap('x', '<leader><tab>', '<plug>(fzf-maps-x)', { noremap = true })
vim.api.nvim_set_keymap('o', '<leader><tab>', '<plug>(fzf-maps-o)', { noremap = true })
vim.api.nvim_set_keymap('i', '<c-x><c-k>', '<plug>(fzf-complete-word)', { noremap = true })
vim.api.nvim_set_keymap('i', '<c-x><c-f>', '<plug>(fzf-complete-path)', { noremap = true })
vim.api.nvim_set_keymap('i', '<c-x><c-j>', '<plug>(fzf-complete-file-ag)', { noremap = true })
vim.api.nvim_set_keymap('i', '<c-x><c-l>', '<plug>(fzf-complete-line)', { noremap = true })
vim.api.nvim_set_keymap('i', '<c-x><c-k>', 'fzf#vim#complete#word({"left": "15%"})', { expr = true, noremap = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>/', ':Ag<space>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>f', ':Files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':Buffers<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dab', ':1,$bd<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gs', ':Git<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ws', ':StripWhitespace<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ln', ':set rnu!<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>a', ':cclose<CR>', { noremap = true, silent = true })



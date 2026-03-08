vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.updatetime = 250
vim.opt.autowrite = true
vim.opt.mouse = 'a'
vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 8
vim.opt.clipboard = 'unnamedplus'

-- Undo/Backup
local tmp = vim.fn.stdpath('data')
vim.opt.dir = tmp .. '/swap/'
vim.opt.backup = true
vim.opt.backupdir = tmp .. '/backup/'
vim.opt.undofile = true
vim.opt.undodir = tmp .. '/undo/'

-- 80 col highlight
vim.cmd [[
  highlight ColorColumn ctermbg=magenta
  call matchadd('ColorColumn', '\%81v', 100)
]]

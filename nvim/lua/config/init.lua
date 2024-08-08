-- Basic settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.updatetime = 250
vim.opt.autowrite = true
vim.opt.mouse = 'a'
vim.opt.ttyfast = true
vim.opt.lazyredraw = true
vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.cmd('colorscheme dracula')
vim.cmd('highlight Normal guibg=NONE')
vim.cmd('highlight nonText guibg=NONE')

-- Undo/Backup
local tmp = vim.fn.stdpath('data')
vim.opt.dir = tmp .. '/swap/'
vim.opt.backup = true
vim.opt.backupdir = tmp .. '/backup/'
vim.opt.undofile = true
vim.opt.undodir = tmp .. '/undo/'

-- 80 Col highlight
vim.cmd [[
  highlight ColorColumn ctermbg=magenta
  call matchadd('ColorColumn', '\%81v', 100)
]]
-- Remember last position
vim.cmd [[
  if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif
]]

-- Tmux Navigator
if vim.fn.has('nvim') == 1 then
  vim.api.nvim_set_keymap('n', '<BS>', ':<C-u>TmuxNavigateLeft<CR>', { noremap = true, silent = true })
else
  vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
end

-- Airline
vim.g.airline_extensions = { 'tabline' }
vim.g.airline_extensions_tabline_enabled = 1
vim.g.airline_theme = 'dracula'
vim.g.airline_powerline_fonts = 1

-- Quickscope
vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}

-- Jsonnet
vim.g.jsonnet_fmt_on_save = 0

-- Go Plugin specific stuff
vim.g.go_fmt_command = 'goimports'
vim.g.go_auto_type_info = 1
vim.g.go_addtags_transform = 'camelcase'
vim.g.go_highlight_types = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_def_mapping_enabled = 0

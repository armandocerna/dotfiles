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
vim.cmd[[colorscheme tokyonight]]
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

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were using it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      require("mason").setup()

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, opts)
      end

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local servers = {
        autotools_ls = {},
        bashls = {},
        cssls = {},
        dockerls = {},
        eslint = {},
        emmet_ls = {},
        golangci_lint_ls = {},
        gopls = {},
        helm_ls = {},
        html = {},
        jsonls = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { 'vim' } },
            },
          },
        },
        sqlls = {},
        tailwindcss = {
          settings = {
            tailwindCSS = {
              validate = true,
              classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
              includeLanguages = {
                eelixir = "html-eex",
                eruby = "erb",
                htmlangular = "html",
                templ = "html",
              },
            },
          },
        },
        terraformls = {},
        tflint = {},
        ts_ls = {},
        vimls = {},
        yamlls = {},
      }

      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      for server, config in pairs(servers) do
        config.on_attach = on_attach
        config.capabilities = capabilities
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end,
  },
}

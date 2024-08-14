-- LSP
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "autotools_ls",
    "bashls",
    "cssls",
    "dockerls",
    "eslint",
    "emmet_ls",
    "golangci_lint_ls",
    "gopls",
    "html",
    "helm_ls",
    "jsonls",
    "lua_ls",
    "jsonnet_ls",
    -- "ruby_lsp",
    "sqlls",
    "tailwindcss",
    "terraformls",
    "tsserver",
    "tflint",
    "vimls",
    "yamlls",
  },
})

require('lspconfig').autotools_ls.setup{
  on_attach = on_attach
}

require('lspconfig').bashls.setup{
  on_attach = on_attach
}

require('lspconfig').cssls.setup{
  on_attach = on_attach
}

require('lspconfig').dockerls.setup{
  on_attach = on_attach
}

require('lspconfig').eslint.setup{
  on_attach = on_attach
}

require('lspconfig').emmet_ls.setup{
  on_attach = on_attach
}

require('lspconfig').golangci_lint_ls.setup{
  on_attach = on_attach
}

require('lspconfig').gopls.setup{
  on_attach = on_attach
}

require('lspconfig').helm_ls.setup{
  on_attach = on_attach
}

require('lspconfig').html.setup{
  on_attach = on_attach
}

require('lspconfig').jsonls.setup{
  on_attach = on_attach
}

require('lspconfig').lua_ls.setup{
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim', 'on_attach'}
      }
    }
  }
}

require('lspconfig').sqlls.setup{
  on_attach = on_attach
}

require('lspconfig').tailwindcss.setup{
  on_attach = on_attach,
  settings = {
    tailwindCSS = {
      validate = true,
      classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
      includeLanguages = {
        eelixir = "html-eex",
        eruby = "erb",
        htmlangular = "html",
        templ = "html"
      }
    }
  }
}

require('lspconfig').terraformls.setup{
  on_attach = on_attach
}

require('lspconfig').tflint.setup{
  on_attach = on_attach
}

require('lspconfig').tsserver.setup{
  on_attach = on_attach
}

require('lspconfig').vimls.setup{
  on_attach = on_attach
}

require('lspconfig').yamlls.setup{
  on_attach = on_attach
}


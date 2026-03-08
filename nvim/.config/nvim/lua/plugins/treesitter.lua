return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install({
        "bash", "c", "css", "dockerfile", "go", "gomod", "gosum",
        "html", "javascript", "json", "jsonnet", "lua", "markdown",
        "markdown_inline", "python", "query", "ruby", "rust",
        "toml", "typescript", "vim", "vimdoc", "yaml",
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)
          if lang then
            pcall(vim.treesitter.start, args.buf, lang)
          end
        end,
      })
    end,
  },
}

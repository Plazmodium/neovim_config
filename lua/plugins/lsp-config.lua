return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "angularls",
          "astro",
          "cssls",
          "cssmodules_ls",
          "css_variables",
          "html",
          "jsonls",
          "tsserver",
          "dockerls",
        }})
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup ({})
      lspconfig.tsserver.setup ({})
      lspconfig.angularls.setup ({})
      lspconfig.cssls.setup ({})
      lspconfig.cssmodules_ls.setup ({})
      lspconfig.css_variables.setup ({})
      lspconfig.html.setup ({})
      lspconfig.dockerls.setup ({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}

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
          "eslint",
          "lua_ls",
          "angularls",
          "astro",
          "cssls",
          "cssmodules_ls",
          "css_variables",
          "html",
          "jsonls",
          "ts_ls",
          "dockerls",
        }})
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()

      -- ANGULAR
      local lspconfig = require('lspconfig')

      lspconfig.angularls.setup({
        cmd = { "angular-language-server", "--ngProbeLocations", vim.fn.stdpath("data") .. "/mason/packages/angular-language-server/lib/node_modules", "--tsProbeLocations", vim.fn.stdpath("data") .. "/mason/packages/typescript-language-server", "--stdio" },
        on_attach = function(client, bufnr)
          -- Set up buffer-specific key mappings and options here
          local buf_set_keymap = vim.api.nvim_buf_set_keymap
          local opts = { noremap = true, silent = true }

          buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
          buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        end,
        filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
        root_dir = lspconfig.util.root_pattern("angular.json", "package.json"),
      })


      lspconfig.lua_ls.setup ({})
      lspconfig.ts_ls.setup ({})
      lspconfig.cssls.setup ({})
      lspconfig.cssmodules_ls.setup ({})
      lspconfig.css_variables.setup ({})
      lspconfig.html.setup ({})
      lspconfig.dockerls.setup ({})

      -- ESLint setup
      lspconfig.eslint.setup({
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css" },
        root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.json", ".eslintrc.js"),
      })

      -- Key bindings for LSP actions
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  },

  -- Autocompletion plugins
  {
    'hrsh7th/nvim-cmp',                 -- Autocompletion plugin
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',           -- LSP completion source for nvim-cmp
      'hrsh7th/cmp-buffer',             -- Buffer completion source
      'hrsh7th/cmp-path',               -- File path completion source
      'hrsh7th/cmp-vsnip',              -- Snippet completion source (optional)
      'hrsh7th/vim-vsnip',              -- Snippet engine (optional)
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)  -- You can use other snippet engines here like LuaSnip
          end,
        },
        mapping = {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },   -- Completion from LSP
          { name = 'buffer' },     -- Completion from buffer
          { name = 'path' },       -- Completion from file paths
        }),
      })
    end
  }
}

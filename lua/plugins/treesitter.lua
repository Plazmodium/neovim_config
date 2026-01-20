return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Enable treesitter highlighting for all filetypes
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })

    -- Auto-install parsers when opening a file
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local ft = args.match
        local lang = vim.treesitter.language.get_lang(ft) or ft
        if not pcall(vim.treesitter.language.add, lang) then
          -- Parser not installed, try to install it
          pcall(function()
            require("nvim-treesitter").install({ lang })
          end)
        end
      end,
    })
  end,
}

return {
  --  {
  --  "nvim-neo-tree/neo-tree.nvim",
  -- branch = "v3.x",
  -- dependencies = {
  --"nvim-lua/plenary.nvim",
  --"nvim-tree/nvim-web-devicons",
  --"MunifTanjim/nui.nvim",
  --},
  --config = function()
  --vim.keymap.set('n', '<leader>n', ':Neotree reveal left<CR>', {})
  --vim.keymap.set('n', '<leader>c', ':Neotree close<CR>', {})
  --end
  --},
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
      vim.keymap.set('n', '<leader>n', ':NvimTreeToggle left<CR>', {})
    end,
  }
}

return {
  --{
  --"catppuccin/nvim",
  --name = "catppuccin",
 --priority = 1000,
  --config = function()
  --vim.cmd.colorscheme "catppuccin"
  --end
  --},
  {
    "tanvirtin/monokai.nvim",
    name = "monokai",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "monokai_pro"
    end
  }
}

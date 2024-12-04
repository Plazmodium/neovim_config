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
      vim.cmd.colorscheme("monokai_pro")

      vim.api.nvim_command("highlight OrangeCursor guifg=white guibg=#ff8800")
      vim.api.nvim_command("highlight Visual guibg=#ff8800 guifg=white")
      vim.api.nvim_command("highlight Search guibg=#ff8800 guifg=white")
      vim.api.nvim_command("highlight IncSearch guibg=#ff8800 guifg=white")
      vim.api.nvim_command("highlight CursorLine guibg=#402200")
      vim.api.nvim_command("highlight CursorLineNr guifg=#ff8800")
      vim.api.nvim_command("highlight WildMenu guibg=#ff8800 guifg=white")
    end,
  },
}

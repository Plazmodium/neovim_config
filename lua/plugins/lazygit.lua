--return {
--  "kdheepak/lazygit.nvim",
--  dependencies = {
--    "nvim-lua/plenary.nvim",
--  },
--  config = function()
--    keys = {
--      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
--  end
  --  cmd = {
  --  "LazyGit",
  --    "LazyGitConfig",
  --    "LazyGitCurrentFile",
  --    "LazyGitFilter",
  --    "LazyGitFilterCurrentFile",
  -- },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
-- }

return {
  'kdheepak/lazygit.nvim',
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })
  end,
}

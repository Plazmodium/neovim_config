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
    vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<CR>', { noremap = true, silent = true, desc = "LazyGit" })
  end,
}

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
    vim.keymap.set('n', '<leader>gg', ':LazyGit', { noremap = true, silent = true })
  end,
}

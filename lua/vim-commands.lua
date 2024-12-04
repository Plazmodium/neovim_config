-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.opt.termguicolors = true
vim.opt.guicursor = "n-v-c:block-Cursor/lCursor-blinkwait175-blinkoff150-blinkon175,i:ver25-Cursor/lCursor-blinkwait175-blinkoff150-blinkon175"

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=0")
vim.g.mapleader = " "
vim.wo.relativenumber = true

vim.api.nvim_set_keymap('n', '<Leader>tv', ':vsplit | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>th', ':split | terminal<CR>', { noremap = true, silent = true })


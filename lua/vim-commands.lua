-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.scrolloff = 8 -- Keep 8 lines above/below cursor
vim.opt.undofile = true -- Persistent undo
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case sensitive if uppercase present

-- Set cursor color and style
vim.opt.termguicolors = true
vim.opt.guicursor =
	"n-v-c:block-OrangeCursor/lCursor-blinkwait175-blinkoff150-blinkon175,i:ver25-OrangeCursor/lCursor-blinkwait175-blinkoff150-blinkon175"

-- Define custom highlight groups
vim.api.nvim_command("highlight OrangeCursor guifg=white guibg=#ff8800")
vim.api.nvim_command("highlight Visual guibg=#ff8800 guifg=white")
vim.api.nvim_command("highlight Search guibg=#ff8800 guifg=white")
vim.api.nvim_command("highlight IncSearch guibg=#ff8800 guifg=white")
vim.api.nvim_command("highlight CursorLine guibg=#402200") -- Darker orange for cursor line

-- Make the line number highlight orange
vim.api.nvim_command("highlight CursorLineNr guifg=#ff8800")

-- Set orange color for selection in wildmenu
vim.api.nvim_command("highlight WildMenu guibg=#ff8800 guifg=white")
vim.cmd("set expandtab")

vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=0")
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
vim.g.mapleader = " "
vim.wo.relativenumber = true

vim.api.nvim_set_keymap("n", "<Leader>tv", ":vsplit | terminal<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>th", ":split | terminal<CR>", { noremap = true, silent = true })

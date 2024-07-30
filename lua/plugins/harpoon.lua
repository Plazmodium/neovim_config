return {
  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local mark = require('harpoon.mark')
      local ui = require('harpoon.ui')
      vim.keymap.set('n', '<leader>a', mark.add_file, { noremap = true, silent = true, desc = "Harpoon Add File" })
      vim.keymap.set('n', '<leader>r', mark.rm_file, { noremap = true, silent = true, desc = "Harpoon Remove File" })
      vim.keymap.set('n', '<leader>h', ui.toggle_quick_menu, { noremap = true, silent = true, desc = "Harpoon Toggle Menu" })
      vim.keymap.set('n', '<leader>j', function() ui.nav_file(1) end, { noremap = true, silent = true, desc = "Harpoon Go to File 1" })
      vim.keymap.set('n', '<leader>k', function() ui.nav_file(2) end, { noremap = true, silent = true, desc = "Harpoon Go to File 2" })
      vim.keymap.set('n', '<leader>l', function() ui.nav_file(3) end, { noremap = true, silent = true, desc = "Harpoon Go to File 3" })
      vim.keymap.set('n', '<leader>;', function() ui.nav_file(4) end, { noremap = true, silent = true, desc = "Harpoon Go to File 4" })
    end
  }
}

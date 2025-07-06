local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Example keymaps (add your own as needed)
map('n', '<leader>ff', require('telescope.builtin').find_files, opts)
map('n', '<leader>fg', require('telescope.builtin').live_grep, opts)


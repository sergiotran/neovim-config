vim.g.mapleader = ' '

local keymap = vim.keymap

-- S lit window
keymap.set('n', '<leader>sv', '<C-w>v')
keymap.set('n', '<leader>sh', '<C-w>s')
keymap.set('n', '<leader>se', '<C-w>=')
keymap.set('n', '<leader>sx', ':close<CR>')
-- Tabs
keymap.set('n', '<leader>to', ':tabnew<CR>')
keymap.set('n', '<leader>tx', ':tabclose<CR>')
keymap.set('n', '<leader>tn', ':tabn<CR>')
keymap.set('n', '<leader>tp', ':tabp<CR>')

-- Plugins keymap

-- Vim maximizer
keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>')

-- Nvim Tree
keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

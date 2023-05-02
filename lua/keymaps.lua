vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Quick Escape!
vim.keymap.set('i', 'jk', '<Esc>')

-- Don't use ; or , often enough, so remap ;
vim.keymap.set('n', ';', ':')

-- Make it easier to navigate around splits and vsplits
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Clear the highlighting of the previous search
vim.keymap.set('n', ',/', ':nohlsearch<CR>', { silent = true})

-- FZF Keymaps
vim.keymap.set('n', '<Leader>p', ':Files<CR>')
vim.keymap.set('n', '<Leader>u', ':Buffers<CR>')

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
-- 在插入模式下使用 Ctrl + h/j/k/l 进行光标移动
vim.keymap.set('i', '<C-h>', '<Left>', { noremap = true, silent = true, desc = 'Move Left' })
vim.keymap.set('i', '<C-j>', '<Down>', { noremap = true, silent = true, desc = 'Move Down' })
vim.keymap.set('i', '<C-k>', '<Up>', { noremap = true, silent = true, desc = 'Move Up' })
vim.keymap.set('i', '<C-l>', '<Right>', { noremap = true, silent = true, desc = 'Move Right' })
-- [[ 撤销 ]]
-- 使用 Ctrl + z 进行撤销
vim.keymap.set('n', '<C-z>', 'u', { noremap = true, silent = true, desc = 'Undo' })

vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true, desc = 'Focus window left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true, desc = 'Focus window down' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true, desc = 'Focus window up' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true, desc = 'Focus window right' })

-- vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { silent = true, desc = "files_explorer" })
-- vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { silent = true, desc = "buffers_explorer" })
-- vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { silent = true, desc = "diagnostics_explorer" })

vim.keymap.set('n', '<leader>e', '<Cmd>Neotree<CR>', { silent = true, desc = 'open_file_tree' })

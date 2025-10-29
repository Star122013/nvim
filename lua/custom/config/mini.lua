require('mini.icons').setup()
-- require('mini.tabline').setup()
-- require("mini.statusline").setup()
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.files').setup()
require('mini.pick').setup()
require('mini.extra').setup()
require('mini.comment').setup()
-- require("mini.indentscope").setup()
--   starter.setup({
--     evaluate_single = true,
--     items = {
--       starter.sections.builtin_actions(),
--       starter.sections.recent_files(10, false),
--       starter.sections.recent_files(10, true),
--       -- Use this if you set up 'mini.sessions'
--       starter.sections.sessions(5, true)
--     },
--     content_hooks = {
--       starter.gen_hook.adding_bullet(),
--       starter.gen_hook.indexing('all', { 'Builtin actions' }),
--       starter.gen_hook.padding(3, 2),
--     },
--   })
vim.keymap.set('n', '<leader>mp', '<cmd>Pick files<cr>', { desc = 'Open mini file pick' })
vim.keymap.set('n', '<leader>mf', '<cmd>:lua MiniFiles.open()<cr>', { desc = 'Open mini file explorer' })

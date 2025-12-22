-- For `plugins/markview.lua` users.
return {
  'OXY2DEV/markview.nvim',
  lazy = false,

  -- Completion for `blink.cmp`
  dependencies = { 'saghen/blink.cmp' },

  config = function()
    require('markview').setup {
      preview = {
        icon_provider = 'mini', -- "mini" or "devicons"
      },
    }
  end,
  vim.keymap.set('n', '<leader>mm', '<CMD>Markview<CR>', { desc = 'Toggle `markview` globally' }),
  vim.keymap.set('n', '<leader>ms', '<CMD>Markview splitToggle<CR>', { desc = 'Toggles `splitview` for current buffer.' }),
}

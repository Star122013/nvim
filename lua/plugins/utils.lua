return {
  {
    'mini.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    after = function()
      require('mini.pairs').setup()
    end,
  },
}

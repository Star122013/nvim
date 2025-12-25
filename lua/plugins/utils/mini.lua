return {
  {
    'mini.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    after = function()
      require('mini.pairs').setup()
      require('mini.ai').setup()
    end,
  },
}

return {
  'nvim-mini/mini.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('mini.ai').setup()
    require('mini.surround').setup()
    require('mini.misc').setup()
  end,
}

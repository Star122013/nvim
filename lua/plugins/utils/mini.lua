return {
  'nvim-mini/mini.nvim',
  config = function()
    require('mini.ai').setup()
    require('mini.surround').setup()
    require('mini.misc').setup()
  end,
}

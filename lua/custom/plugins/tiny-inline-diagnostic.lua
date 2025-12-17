return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  priority = 1000,
  config = function()
    require 'custom.config.diagnostic'
  end,
}

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require 'custom.config.nvim-treesitter'
  end,
}

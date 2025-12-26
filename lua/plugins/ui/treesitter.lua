return {
  'nvim-treesitter/nvim-treesitter',
  version = false,
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = { ensure_installed = { 'yaml', 'json' } },
  config = function(_, opts)
    require('nvim-treesitter').setup { install_dir = vim.fn.stdpath 'data' .. '/site' }
    require('nvim-treesitter').install { opts.ensure_installed }
  end,
}

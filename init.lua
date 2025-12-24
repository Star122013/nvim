require 'custom.options'
require 'custom.keymaps'
require 'custom.lsp'
require 'custom.diagnostics'
require 'custom.autocmd'
require 'plugins'
-- require 'custom.lazy'
--

vim.pack.add({
  'https://github.com/BirdeeHub/lze',
  -- theme
  { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },

  -- coding
  -- cmp
  { src = 'https://github.com/Saghen/blink.cmp', version = 'v1.7.0' },
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
  { src = 'https://github.com/xzbdmw/colorful-menu.nvim' },
  -- format
  { src = 'https://github.com/stevearc/conform.nvim' },
  -- diagnostics
  { src = 'https://github.com/rachartier/tiny-inline-diagnostic.nvim' },

  -- utils
  { src = 'https://github.com/nvim-mini/mini.nvim' },

  -- treesitter
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },

  -- ui
  { src = 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim' },
  { src = 'https://github.com/rebelot/heirline.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/akinsho/bufferline.nvim' },
  { src = 'https://github.com/tiagovla/scope.nvim' },
  { src = 'https://github.com/saghen/blink.indent', version = 'v2.1.0' },
}, {
  -- prevent packadd! or packadd like this to allow on_require handler to load plugin spec
  load = function() end,
  -- choose your preference for install confirmation
  confirm = true,
})

vim.cmd.packadd 'lze'

require('lze').load 'plugins'

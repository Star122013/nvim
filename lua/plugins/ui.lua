return {
  {
    'heirline.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    after = function()
      require('heirline').setup {
        statusline = require('config.heirline.statusline').DefaultStatusline,
      }
    end,
  },
  {
    'nvim-web-devicons',
  },
  {
    'bufferline.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    after = function()
      require('bufferline').setup {
        highlights = require('catppuccin.special.bufferline').get_theme {
          styles = { 'bold' },
        },
        options = {
          diagnostics = 'nvim_lsp',
          offsets = {
            {
              filetype = 'neo-tree',
              text = 'File Explorer',
              separator = true,
              text_align = 'center',
            },
            {
              filetype = 'alpha',
              text = '',
              separator = false,
            },
          },
        },
      }
    end,
  },
  {
    'scope.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    after = function()
      require('scope').setup {}
    end,
  },
  -- indent and rainbow
  {
    'blink.indent',
    event = { 'BufReadPre', 'BufNewFile' },
    after = function()
      require('blink.indent').setup {
        scope = {
          char = '│',
        },
        static = {
          char = '│',
        },
      }
    end,
  },
  {
    'rainbow-delimiters.nvim',
    event = { 'BufNewFile', 'BufReadPre' },
    after = function()
      require('rainbow-delimiters.setup').setup {}
    end,
  },
}

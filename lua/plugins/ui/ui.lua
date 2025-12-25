return {
  {
    'nui.nvim',
    dep_of = 'noice.nvim',
  },
  {
    'nvim-web-devicons',
  },
  {
    'noice.nvim',
    event = { 'BufNewFile', 'BufReadPre' },
    after = function()
      require('noice').setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
          },
        },
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      }
    end,
  },
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
  {
    'rainbow-delimiters.nvim',
    event = { 'BufNewFile', 'BufReadPre' },
    after = function()
      require('rainbow-delimiters.setup').setup {
        highlight = {
          'SnacksRainbow1',
          'SnacksRainbow2',
          'SnacksRainbow3',
          'SnacksRainbow4',
          'SnacksRainbow5',
          'SnacksRainbow6',
          'SnacksRainbow7',
        },
      }
    end,
  },
}

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {},
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        background = { -- :h background
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = false, -- disables setting the background color.
        float = {
          transparent = true,           -- enable transparent floating windows
          solid = false,                -- use solid styling for floating windows, see |winborder|
        },
        show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
        term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false,              -- dims the background color of inactive window
          shade = 'dark',
          percentage = 0.15,            -- percentage of the shade to apply to the inactive window
        },
        styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { 'italic' },      -- Change the style of comments
          conditionals = { 'italic' },
        },
        lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
          virtual_text = {
            errors = { 'italic' },
            hints = { 'italic' },
            warnings = { 'italic' },
            information = { 'italic' },
            ok = { 'italic' },
          },
          underlines = {
            errors = { 'underline' },
            hints = { 'underline' },
            warnings = { 'underline' },
            information = { 'underline' },
            ok = { 'underline' },
          },
          inlay_hints = {
            background = true,
          },
        },
        color_overrides = {},
        default_integrations = true,
        auto_integrations = true,
      }
      vim.cmd 'colorscheme catppuccin'

      local colors = require('catppuccin.palettes').get_palette 'mocha'

      vim.api.nvim_set_hl(0, 'SnacksRainbow1', { fg = colors.red })
      vim.api.nvim_set_hl(0, 'SnacksRainbow2', { fg = colors.yellow })
      vim.api.nvim_set_hl(0, 'SnacksRainbow3', { fg = colors.blue })
      vim.api.nvim_set_hl(0, 'SnacksRainbow4', { fg = colors.peach })
      vim.api.nvim_set_hl(0, 'SnacksRainbow5', { fg = colors.green })
      vim.api.nvim_set_hl(0, 'SnacksRainbow6', { fg = colors.mauve })
      vim.api.nvim_set_hl(0, 'SnacksRainbow7', { fg = colors.teal })
    end,
  },
  -- {
  --   "neanias/everforest-nvim",
  --   version = false,
  --   lazy = false,
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   -- Optional; default configuration will be used if setup isn't called.
  --   config = function()
  --     require("everforest").setup({
  --       -- Your config here
  --       background = "soft",
  --       transparent_background_level = 0,
  --       italics = true,
  --     })
  --
  --     vim.cmd 'colorscheme everforest'
  --
  --
  --     vim.api.nvim_set_hl(0, 'SnacksRainbow1', { fg = "#E67E80" })
  --     vim.api.nvim_set_hl(0, 'SnacksRainbow2', { fg = "#DBBC7F" })
  --     vim.api.nvim_set_hl(0, 'SnacksRainbow3', { fg = "#7FBBB3" })
  --     vim.api.nvim_set_hl(0, 'SnacksRainbow4', { fg = "#E69875" }) -- peach → orange
  --     vim.api.nvim_set_hl(0, 'SnacksRainbow5', { fg = "#A7C080" })
  --     vim.api.nvim_set_hl(0, 'SnacksRainbow6', { fg = "#D699B6" }) -- mauve → purple
  --     vim.api.nvim_set_hl(0, 'SnacksRainbow7', { fg = "#83C092" }) -- teal → aqua
  --   end,
  -- },

  {
    "mvllow/modes.nvim",
    event = "VeryLazy",
    opts = {
      colors = {
        insert = "#a6e3a1",
        replace = "#94e2d5",
        visual = "#cba6f7",
      },
      line_opacity = 0.30,
    },
  },
}

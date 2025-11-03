require('catppuccin').setup {
  flavour = 'mocha',
  transparent_background = true,
  float = {
    transparent = true,
    solid = true,
  },
  auto_integrations = true,
  custom_highlights = function()
    return {
      RainbowRed = { fg = '#E06C75' },
      RainbowYellow = { fg = '#E5C07B' },
      RainbowBlue = { fg = '#61AFEF' },
      RainbowGreen = { fg = '#98C379' },
      RainbowOrange = { fg = '#D19A66' },
      RainbowCyan = { fg = '#56B6C2' },
      RainbowViolet = { fg = '#C678DD' },
    }
  end,
}

vim.cmd.colorscheme 'catppuccin'

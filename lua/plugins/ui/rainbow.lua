return {
  'HiPhish/rainbow-delimiters.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
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
}

return {
  'folke/which-key.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
  config = function()
    require('which-key').setup {
      preset = 'helix',
      win = {
        no_overlap = true,
        border = 'rounded',
      },
      icons = {
        mappings = false,
      },
    }
  end,
}

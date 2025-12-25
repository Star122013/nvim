return {
  'trouble.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    {
      '<leader>xx',
      function()
        require('trouble').toggle {
          mode = 'diagnostics',
        }
      end,
      mode = { 'n' },
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xQ',
      function()
        require('trouble').toggle 'qflist'
      end,
      desc = 'Quickfix List (Trouble)',
    },
  },
}

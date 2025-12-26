return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    vim.diagnostic.config {
      virtual_text = false,
      virtual_lines = false,
      underline = true,
      update_in_insert = true,
      -- signs = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '●',
          [vim.diagnostic.severity.WARN] = '●',
          [vim.diagnostic.severity.INFO] = '●',
          [vim.diagnostic.severity.HINT] = '●',
        },
      },
    }
    require('tiny-inline-diagnostic').setup {
      preset = 'classic',
      transparent_bg = true,
      options = {
        show_source = true,
        multilines = true,
        show_all_diags_on_cursorline = true,
        enable_on_insert = false,
        throttle = 20,
        overflow = {
          mode = 'wrap',
        },
        add_messages = {
          display_count = true,
        },
        format = function(diagnostic)
          return diagnostic.message
        end,
      },
    }
  end,
}

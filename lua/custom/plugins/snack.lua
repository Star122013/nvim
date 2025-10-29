return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {},
  config = function()
    require 'custom.config.snack'
    local map = function(key, func, desc)
      vim.keymap.set('n', key, func, { desc = desc })
    end

    map('<leader>ff', Snacks.picker.smart, 'Smart find file')
    map('<leader>fo', Snacks.picker.recent, 'Find recent file')
    map('<leader>fw', Snacks.picker.grep, 'Find content')
    map('<leader>fh', function()
      Snacks.picker.help { layout = 'dropdown' }
    end, 'Find in help')
    map('<leader>fl', Snacks.picker.picker_layouts, 'Find picker layout')
    map('<leader>fk', function()
      Snacks.picker.keymaps { layout = 'dropdown' }
    end, 'Find keymap')
    map('<leader>fb', function()
      Snacks.picker.buffers { sort_lastused = true }
    end, 'Find buffers')
    map('<leader>fm', Snacks.picker.marks, 'Find mark')
    map('<leader>fn', function()
      Snacks.picker.notifications { layout = 'dropdown' }
    end, 'Find notification')
    map('grr', Snacks.picker.lsp_references, 'Find lsp references')
    map('<leader>fi', Snacks.picker.icons, 'Find icon')
    map('<leader>fd', Snacks.picker.diagnostics_buffer, 'Find diagnostic in current buffer')
  end,
}

---@diagnostic disable: undefined-global
return {
  {
    'snacks.nvim',
    lazy = false,
    -- stylua: ignore
    keys = {
      { "<leader><space>", function() Snacks.picker.smart() end, mode = {'n'}, desc = "Smart Find Files" },
      { "<leader>/", function() Snacks.picker.grep() end, mode = {'n'}, desc = "Grep" },
      { "<leader>b", function() Snacks.picker.buffers() end, mode = {'n'}, desc = "Buffers" },
      { "<leader>n", function() Snacks.picker.notifications() end, mode = {'n'}, desc = "Notification History" },
      -- find
      { "<leader>ff", function() Snacks.picker.files() end, mode = {'n'}, desc = "Find Files" },
      { "<leader>fg", function() Snacks.picker.git_files() end, mode = {'n'}, desc = "Find Git Files" },
      { "<leader>fp", function() Snacks.picker.projects() end, mode = {'n'}, desc = "Projects" },
      -- git
      { "<leader>gb", function() Snacks.picker.git_branches() end, mode = {'n'}, desc = "Git Branches" },
      { "<leader>gl", function() Snacks.picker.git_log() end, mode = {'n'}, desc = "Git Log" },
      { "<leader>gs", function() Snacks.picker.git_status() end, mode = {'n'}, desc = "Git Status" },
      { "<leader>gd", function() Snacks.picker.git_diff() end, mode = {'n'}, desc = "Git Diff (Hunks)" },
      -- search
      { "<leader>sb", function() Snacks.picker.lines() end, mode= {'n'}, desc = "Buffer Lines" },
      { "<leader>sd", function() Snacks.picker.diagnostics() end, mode = {'n'}, desc = "Diagnostics" },
      { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, mode = {'n'}, desc = "Buffer Diagnostics" },
      { "<leader>sh", function() Snacks.picker.help() end, mode = {'n'}, desc = "Help Pages" },
      { "<leader>si", function() Snacks.picker.icons() end, mode = {'n'}, desc = "Icons" },
      { "<leader>sM", function() Snacks.picker.man() end, mode = {'n'}, desc = "Man Pages" },
      { "<leader>sq", function() Snacks.picker.qflist() end, mode = {'n'}, desc = "Quickfix List" },
      -- lsp
      { "gd", function() Snacks.picker.lsp_definitions() end, mode = {'n'}, desc = "Goto Definition" },
      { "gD", function() Snacks.picker.lsp_declarations() end, mode = {'n'}, desc = "Goto Declaration" },
      { "gr", function() Snacks.picker.lsp_references() end, mode = {'n'}, nowait = true, desc = "References" },
      { "<leader>ss", function() Snacks.picker.lsp_symbols() end, mode = {'n'}, desc = "LSP Symbols" },
    },
    after = function()
      ---@diagnostic disable-next-line: undefined-field
      require('snacks').setup {
        notifier = {
          enabled = true,
          timeout = 3000,
        },
        picker = {
          enabled = true,
        },
        indent = {
          enabled = true,
          scope = {
            enabled = true, -- enable highlighting the current scope
            hl = {
              'SnacksRainbow1',
              'SnacksRainbow2',
              'SnacksRainbow3',
              'SnacksRainbow4',
              'SnacksRainbow5',
              'SnacksRainbow6',
              'SnacksRainbow7',
            },
          },
        },
      }
    end,
  },
}

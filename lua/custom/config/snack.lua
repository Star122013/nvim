require('snacks').setup {
  picker = {
    matcher = { frecency = true, cwd_bonus = true, history_bonus = true },
    formatters = { icon_width = 3 },
    -- win = { input = { keys = { ['<Esc>'] = { 'close', mode = { 'n', 'i' } } } } },
  },
  notifier = {},
  dashboard = {
    preset = {
      keys = {
        { icon = '󰈞 ', key = 'f', desc = 'Find files', action = ':lua Snacks.picker.smart()' },
        { icon = ' ', key = 'o', desc = 'Find history', action = 'lua Snacks.picker.recent()' },
        { icon = ' ', key = 'e', desc = 'New file', action = ':enew' },
        { icon = ' ', key = 'o', desc = 'Recent files', action = ':lua Snacks.picker.recent()' },
        { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
        {
          icon = '󰔛 ',
          key = 'P',
          desc = 'Lazy Profile',
          action = ':Lazy profile',
          enabled = package.loaded.lazy ~= nil,
        },
        { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
      },
      sections = {
        { section = 'header' },
        { section = 'keys', gap = 1 },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = { 2, 2 } },
        { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 2 },
        { section = 'startup' },
      },
    },
  },
  indent = {
    indent = {
      priority = 1,
      enabled = true, -- enable indent guides
      char = '│',
      only_scope = false, -- only show indent guides of the scope
      only_current = true, -- only show indent guides in the current window
      -- hl = "SnacksIndent8", ---@type string|string[] hl groups for indent guides
      -- can be a list of hl groups to cycle through
      -- hl = {
      --   "SnacksIndent1",
      --   "SnacksIndent2",
      --   "SnacksIndent3",
      --   "SnacksIndent4",
      --   "SnacksIndent5",
      --   "SnacksIndent6",
      --   "SnacksIndent7",
      --   "SnacksIndent8",
      -- },
    },
    scope = {
      enabled = true, -- enable highlighting the current scope
      priority = 200,
      char = '│',
      underline = false, -- underline the start of the scope
      only_current = true, -- only show scope in the current window
      -- hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
      hl = {
        'RainbowRed',
        'RainbowYellow',
        'RainbowBlue',
        'RainbowOrange',
        'RainbowGreen',
        'RainbowViolet',
        'RainbowCyan',
      },
    },
    chunk = {
      -- when enabled, scopes will be rendered as chunks, except for the
      -- top-level scope which will be rendered as a scope.
      enabled = false,
      -- only show chunk scopes in the current window
      only_current = true,
      priority = 200,
      -- hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
      hl = {
        'RainbowRed',
        'RainbowYellow',
        'RainbowBlue',
        'RainbowOrange',
        'RainbowGreen',
        'RainbowViolet',
        'RainbowCyan',
      },
      char = {
        corner_top = '┌',
        corner_bottom = '└',
        -- corner_top = "╭",
        -- corner_bottom = "╰",
        horizontal = '─',
        vertical = '│',
        arrow = '>',
      },
    },
  },
}

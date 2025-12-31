---@diagnostic disable: undefined-global
return {
  'folke/snacks.nvim',
  lazy = false,
  keys = {
    { "<leader><space>", function() Snacks.picker.smart() end,              mode = { 'n' }, desc = "Smart Find Files" },
    { "<leader>/",       function() Snacks.picker.grep() end,               mode = { 'n' }, desc = "Grep" },
    { "<leader>b",       function() Snacks.picker.buffers() end,            mode = { 'n' }, desc = "Buffers" },
    { "<leader>n",       function() Snacks.picker.notifications() end,      mode = { 'n' }, desc = "Notification History" },
    -- find
    { "<leader>ff",      function() Snacks.picker.files() end,              mode = { 'n' }, desc = "Find Files" },
    { "<leader>fg",      function() Snacks.picker.git_files() end,          mode = { 'n' }, desc = "Find Git Files" },
    { "<leader>fp",      function() Snacks.picker.projects() end,           mode = { 'n' }, desc = "Projects" },
    -- git
    { "<leader>gb",      function() Snacks.picker.git_branches() end,       mode = { 'n' }, desc = "Git Branches" },
    { "<leader>gl",      function() Snacks.picker.git_log() end,            mode = { 'n' }, desc = "Git Log" },
    { "<leader>gs",      function() Snacks.picker.git_status() end,         mode = { 'n' }, desc = "Git Status" },
    { "<leader>gd",      function() Snacks.picker.git_diff() end,           mode = { 'n' }, desc = "Git Diff (Hunks)" },
    { "<leader>gl",      function() Snacks.lazygit.open(opts) end,          mode = { 'n' }, desc = "Lazygit" },
    -- search
    { "<leader>sb",      function() Snacks.picker.lines() end,              mode = { 'n' }, desc = "Buffer Lines" },
    { "<leader>sd",      function() Snacks.picker.diagnostics() end,        mode = { 'n' }, desc = "Diagnostics" },
    { "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end, mode = { 'n' }, desc = "Buffer Diagnostics" },
    { "<leader>sh",      function() Snacks.picker.help() end,               mode = { 'n' }, desc = "Help Pages" },
    { "<leader>si",      function() Snacks.picker.icons() end,              mode = { 'n' }, desc = "Icons" },
    { "<leader>sM",      function() Snacks.picker.man() end,                mode = { 'n' }, desc = "Man Pages" },
    { "<leader>sq",      function() Snacks.picker.qflist() end,             mode = { 'n' }, desc = "Quickfix List" },
    -- lsp
    { "gd",              function() Snacks.picker.lsp_definitions() end,    mode = { 'n' }, desc = "Goto Definition" },
    { "gD",              function() Snacks.picker.lsp_declarations() end,   mode = { 'n' }, desc = "Goto Declaration" },
    { "gr",              function() Snacks.picker.lsp_references() end,     mode = { 'n' }, nowait = true,                desc = "References" },
    { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,        mode = { 'n' }, desc = "LSP Symbols" },
  },
  config = function()
    ---@diagnostic disable-next-line: undefined-field
    require('snacks').setup {
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = true, },
      words = { enabled = true },
      lazygit = { enabled = true },
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
      dashboard = {
        enabled = true,
        header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],

        sections = {
          { section = "header", pane = 1 },

          {
            pane = 2,
            section = "terminal",
            -- cmd = "echo '  Hello World'",
            cmd = "colorscript -e square",
            height = 5,
            padding = 1,
          },

          { section = "keys", gap = 1, padding = 1, pane = 1 },

          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },

          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },

          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },

          { section = "startup", pane = 1 },
        },
      }
    }
    vim.api.nvim_create_autocmd("LspProgress", {
      callback = function(ev)
        local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
        ---@diagnostic disable-next-line: param-type-mismatch
        vim.notify(vim.lsp.status(), "info", {
          id = "lsp_progress",
          title = "LSP Progress",
          opts = function(notif)
            notif.icon = ev.data.params.value.kind == "end" and " "
                or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
          end,
        })
      end,
    })
  end,
}

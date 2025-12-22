return {
  -- cmp
  {
    'blink.cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    after = function()
      require('blink.cmp').setup {
        keymap = {
          preset = 'none',
          ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
          ['<C-e>'] = { 'hide', 'fallback' },
          ['<CR>'] = { 'accept', 'fallback' },
          ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
          ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
          ['<Up>'] = { 'select_prev', 'fallback' },
          ['<Down>'] = { 'select_next', 'fallback' },
          ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
          ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
          ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
          ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
          ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
        },
        signature = { enabled = true },
        completion = {
          menu = {
            border = 'rounded',
            draw = {
              columns = { { 'kind_icon' }, { 'label', gap = 1 } },
              components = {
                label = {
                  text = function(ctx)
                    return require('colorful-menu').blink_components_text(ctx)
                  end,
                  highlight = function(ctx)
                    return require('colorful-menu').blink_components_highlight(ctx)
                  end,
                },
              },
            },
          },
          documentation = {
            auto_show = true,
            window = {
              border = 'rounded',
            },
          },
          list = {
            selection = {
              preselect = false,
              auto_insert = false,
            },
          },
        },
        cmdline = {
          completion = {
            menu = {
              auto_show = true,
            },
          },
        },
        fuzzy = { implementation = 'prefer_rust_with_warning' },
      }
    end,
  },
  {
    'friendly-snippets',
    dep_of = 'blink.cmp',
  },
  {
    'colorful-menu.nvim',
    dep_of = 'blink.cmp',
  },

  -- format
  {
    'conform.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    after = function()
      require('conform').setup {
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_format = 'fallback',
        },
        formatters_by_ft = {
          lua = { 'stylua' },
          cpp = { 'clang-format' },
          c = { 'clang-format' },
          typst = { 'typstyle' },
          nix = { 'nixfmt' },
          -- markdown = { 'mdformat' },
          -- kdl = { "kdlfmt" },
          -- Conform will run multiple formatters sequentially
          python = { 'isort', 'black' },
          qml = { 'qmlformat' },
          -- You can customize some of the format options for the filetype (:help conform.format)
          rust = { 'rustfmt', lsp_format = 'fallback' },
          -- Conform will run the first available formatter
          javascript = { 'prettierd', 'prettier', stop_after_first = true },
        },
      }
    end,
  },
}

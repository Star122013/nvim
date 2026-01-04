return {
  'saghen/blink.cmp',
  version = '1.*',
  event = 'LazyFile',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'xzbdmw/colorful-menu.nvim',
  },
  config = function()
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
            columns = { { "label", gap = 1 }, { "kind_icon", "kind" } },
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

      sources = {
        -- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
        default = { 'lsp', 'path', 'snippets', 'buffer' },

        per_filetype = {
          markdown = { 'markview', 'lsp', 'path', 'snippets', 'buffer' },
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
}

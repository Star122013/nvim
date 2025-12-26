return require('utils.lang').setup {
  treesitter = { 'lua' },

  format = {
    lua = { 'stylua' },
  },

  lsp = {
    emmylua_ls = {
      cmd = { 'emmylua_ls' },
      filetypes = { 'lua' },
      root_markers = {
        '.luarc.json',
        '.emmyrc.json',
        '.luacheckrc',
        '.git',
      },
      workspace_required = false,
    },
  },
}

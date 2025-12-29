return require('utils.lang').setup {
  treesitter = { 'qmljs' },

  lsp = {
    qmlls = {
      cmd = { 'qmlls' },
      filetypes = { 'qml', 'qmljs' },
      root_markers = { '.git' },
    }
  },

  format = {
    qml = { 'qmlformat' }
  }
}

vim.diagnostic.config {
  virtual_text = true,
  virtual_lines = { current_line = true },
  underline = true,
  update_in_insert = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '󰌵',
    },
  },
}

vim.lsp.enable 'astro'
vim.lsp.enable 'tinymist'

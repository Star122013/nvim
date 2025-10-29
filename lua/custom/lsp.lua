vim.diagnostic.config {
  virtual_text = true,
  virtual_lines = { current_line = true },
  underline = true,
  update_in_insert = true,
}

vim.lsp.enable 'lua_ls'
vim.lsp.enable 'clangd'

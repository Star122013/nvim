local TSInstalled = {
  'lua',
  'c',
  'cpp',
  'rust',
  'nix',
  'nu',
  'markdown',
  'markdown_inline',
  'vimdoc',
  'qmljs',
}

return {
  {
    'nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    after = function()
      require('nvim-treesitter').setup {
        -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
        install_dir = vim.fn.stdpath 'data' .. '/site',
      }

      require('nvim-treesitter').install(TSInstalled)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = TSInstalled,
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}

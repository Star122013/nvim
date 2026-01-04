local filetypes = {
  "yaml",
  "latex",
  "typst",
  "markdown",
  "norg",
  "rmd",
  "org",
  "mdx",
}

return { {
  require('utils.lang').setup {
    treesitter = { 'markdown' },

    lsp = {
      marksman = {
        cmd = { 'marksman', 'server' },
        filetypes = { 'markdown', 'markdown.mdx' },
        root_markers = { '.marksman.toml', '.git' },
      }
    }
  }
},
  {
    {
      "OXY2DEV/markview.nvim",
      lazy = false,
      ft = filetypes,
      -- Completion for `blink.cmp`
      dependencies = { "saghen/blink.cmp" },

    },
  }
}

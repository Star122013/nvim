require 'custom.options'
require 'custom.keymaps'
require 'custom.lsp'
require 'custom.diagnostics'
require 'custom.autocmd'
-- require 'custom.lazy'
--
vim.pack.add({
    "https://github.com/BirdeeHub/lze",
    {src = "https://github.com/catppuccin/nvim", name = "catppuccin",}
}, {
  -- prevent packadd! or packadd like this to allow on_require handler to load plugin spec
  load = function() end,
  -- choose your preference for install confirmation
  confirm = true,
})

vim.cmd.packadd("lze")


require('lze').load({
    "catppuccin",
    after = function()
        require("catppuccin").setup({
            flavour = "mocha",
        })
        vim.cmd("colorscheme catppuccin")
    end
})

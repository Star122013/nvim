vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = false

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2

vim.opt.autoread = true

vim.o.showtabline = 2

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.undofile = true
vim.opt.fillchars:append { eob = ' ' }

vim.opt.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'

local components = require 'config.heirline.components'
vim.o.cmdheight = 0

local M = {}
M.DefaultStatusline = {
  components.Mode,
  components.Space,
  components.FileNameBlock,
  components.Space,
  components.Git,
  components.Diagnostics,
  components.Align,
  components.LSPActive,
  components.Space,
  components.FileType,
  components.Space,
  components.Ruler,
  components.Space,
  components.ScrollBar,
}

return M

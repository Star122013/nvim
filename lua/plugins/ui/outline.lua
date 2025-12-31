return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = { -- Example mapping to toggle outline
    { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
  config = function()
    require('outline').setup {
      symbol_folding = {
        autofold_depth = 1,
        auto_unfold = {
          hovered = true,
        },
      },
      outline_window = {
        auto_jump = true,
      },
      symbols = {
        icon_fetcher = function(kind, bufnr, symbol) return kind:sub(1, 1) end,
      }
    }
  end
}

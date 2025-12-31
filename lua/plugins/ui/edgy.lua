return {
  "folke/edgy.nvim",
  event = "LazyFile",
  config = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
    require("edgy").setup({
      -- 定义左侧栏的布局
      left = {
        -- Neo-tree filesystem always takes half the screen height
        {
          title = "Neo-Tree",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          size = { height = 0.5 },
        },
        {
          title = function()
            local buf_name = vim.api.nvim_buf_get_name(0) or "[No Name]"
            return vim.fn.fnamemodify(buf_name, ":t")
          end,
          ft = "Outline",
          pinned = true,
          open = "SymbolsOutlineOpen",

        },
        "neo-tree",
      },
      animate = {
        enabled = true,
      },
    })
  end
}

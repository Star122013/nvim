-- lua/plugins/lint.lua
return {
  "mfussenegger/nvim-lint",
  event = "LazyFile",
  opts = {
    linters_by_ft = {
      -- text = { "codespell" },
      -- json = { "jsonlint" },
      -- dockerfile = { "hadolint" },
    },
  },
  config = function(_, opts)
    local lint = require("lint")

    -- 1. 赋值 linters
    lint.linters_by_ft = opts.linters_by_ft

    -- 2. 设置自动触发逻辑 (核心逻辑放在这里)
    local lint_augroup = vim.api.nvim_create_augroup("nvim-lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("AutoRoot", {}),
  callback = function(args)
    -- 定义要查找的标志文件
    local root_names = { "flake.nix", ".envrc", ".git", "Makefile", "cargo.toml" }

    -- 向上查找包含这些文件的最近目录
    local root = vim.fs.root(args.buf, root_names)

    -- 找到了切换过去
    if root and root ~= vim.fn.getcwd() then
      vim.cmd.cd(root)
      vim.notify("已切换环境目录: " .. root)
    end
  end,
})

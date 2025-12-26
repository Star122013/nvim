local M = {}

---@class LspServerConfig
---@field cmd string[] The command and arguments to start the language server.
---@field filetypes? string[] Optional filetypes to attach this LSP to. Defaults to the server name.
---@field root_markers? string[] Optional markers to find the project root. Defaults to {'.git'}.
---@field settings? table Optional settings to send to the server.
---@field init_options? table Optional initialization options for the server.
---@field capabilities? table
---@field on_attach? fun(client: vim.lsp.Client, bufnr: integer)
---@field on_init? fun(client: vim.lsp.Client, init_result: table)
---@field before_init? fun(params: table, config: table)

---@class LangConfig
---@field treesitter? string[]
---@field format? table<string, string[]>
---@field lsp? table<string, LspServerConfig>
---@field linters? table<string, string[]>

---@param config LangConfig
function M.setup(config)
  local specs = {}
  if config.treesitter then
    table.insert(specs, {
      'nvim-treesitter/nvim-treesitter',
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        vim.list_extend(opts.ensure_installed, config.treesitter)
      end,
    })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = config.treesitter,
      callback = function(args)
        local ok, msg = pcall(vim.treesitter.start, args.buf)
        if not ok then
          vim.notify('Treesitter start failed: ' .. msg, vim.log.levels.WARN)
        end
      end,
    })
  end
  if config.linters then
    table.insert(specs, {
      'mfussenegger/nvim-lint',
      opts = {
        linters_by_ft = config.linters,
      },
    })
  end
  if config.format then
    table.insert(specs, {
      'stevearc/conform.nvim',
      opts = {
        formatters_by_ft = config.format,
      },
    })
  end
  if config.lsp then
    for name, lsp_conf in pairs(config.lsp) do
      local ft = lsp_conf.filetypes or { name }
      local markers = lsp_conf.root_markers or { '.git' }
      local cmd = lsp_conf.cmd

      vim.api.nvim_create_autocmd('FileType', {
        pattern = ft,
        callback = function(args)
          local root = vim.fs.root(args.buf, markers) or vim.fn.getcwd()

          vim.lsp.start({
            name = name,
            cmd = cmd,
            root_dir = root,
            settings = lsp_conf.settings,
            init_options = lsp_conf.init_options,
            capabilities = lsp_conf.capabilities,
            on_attach = lsp_conf.on_attach,
            on_init = lsp_conf.on_init,
            before_init = lsp_conf.before_init,
          }, { bufnr = args.buf })
        end,
      })
    end
  end

  return specs
end

return M

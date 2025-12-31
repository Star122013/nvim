return {
  'nanozuki/tabby.nvim',
  event = "LazyFile",
  config = function()
    vim.o.showtabline = 2
    vim.opt.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'
    vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true })
    -- move current tab to previous position
    vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
    -- move current tab to next position
    vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })

    local theme = {
      fill = 'TabLineFill',
      -- Catppuccin Mocha
      head = { fg = '#1e1e2e', bg = '#89b4fa', style = 'bold' },        -- 头部高亮 (蓝色)
      current_tab = { fg = '#1e1e2e', bg = '#cba6f7', style = 'bold' }, -- 当前 Tab (淡紫色)
      tab = { fg = '#cdd6f4', bg = '#313244' },                         -- 未选中 Tab (深灰色背景)
      win = { fg = '#cdd6f4', bg = '#313244' },                         -- 未选中 Buffer
      current_win = { fg = '#1e1e2e', bg = '#a6e3a1', style = 'bold' }, -- 当前 Buffer (绿色)
      tail = { fg = '#1e1e2e', bg = '#89b4fa', style = 'bold' },        -- 尾部
    }

    require('tabby.tabline').set(function(line)
      return {
        {
          -- 左侧：装饰块
          { '  ', hl = theme.head },
          line.sep('', theme.head, theme.fill),
        },

        -- 左侧：显示当前 Tab 下的所有窗口/Buffer
        line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
          return {
            line.sep('', win.is_current() and theme.current_win or theme.win, theme.fill),
            win.is_current() and '' or '',
            win.buf_name(),
            win.is_current() and ' ' or '', -- padding
            line.sep('', win.is_current() and theme.current_win or theme.win, theme.fill),
            hl = win.is_current() and theme.current_win or theme.win,
            margin = ' ',
          }
        end),
        line.spacer(),
        -- 右侧：显示所有 Tab 的序号
        line.tabs().foreach(function(tab)
          local hl = tab.is_current() and theme.current_tab or theme.tab
          return {
            line.sep('', hl, theme.fill),
            tab.is_current() and '' or '',
            tab.number(), -- 只显示序号
            line.sep('', hl, theme.fill),
            hl = hl,
            margin = ' ',
          }
        end),

        {
          -- 最右侧：装饰尾部
          line.sep('', theme.tail, theme.fill),
          { '  ', hl = theme.tail },
        },

        hl = theme.fill,
      }
    end)
  end,
}

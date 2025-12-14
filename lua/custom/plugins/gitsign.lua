return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    -- 符号配置：Catppuccin Mocha 这种现代主题，
    -- 使用居中的粗线条 '┃' 往往比靠左的色块 '▎' 看起来更有质感且对齐更准。
    signs = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },

    -- 暂存区符号（可选，让暂存区看起来不一样）
    signs_staged = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },

    signcolumn = true, -- 开启左侧符号列
    numhl = false, -- 保持关闭，Mocha 的行号颜色本身已经很好了
    linehl = false, -- 保持关闭，避免背景色块显得脏
    word_diff = false, -- 默认关闭，可以在 on_attach 里加个快捷键切换

    -- Blame 配置
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = 300, -- 稍微缩短一点延迟，感觉更跟手（300-500均可）
      ignore_whitespace = false,
      virt_text_priority = 100,
    },

    -- 格式化 Blame：使用相对时间（如 "3 months ago"）看起来更直观
    current_line_blame_formatter = '<author>, <author_time:%R> • <summary>',

    -- 这是一个关键点：让 Blame 的灰色适配 Mocha 的 Overlay0 颜色
    -- 下面在 on_attach 或者 init 并没有直接设置颜色的选项
    -- 颜色通常由 Catppuccin 主题自动接管（见文末说明）

    preview_config = {
      border = 'rounded', -- 圆角
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1,
    },

    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- 导航：跳转修改
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Next Hunk' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Prev Hunk' })

      -- 常用操作
      map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage Hunk' }) -- 暂存当前块
      map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset Hunk' }) -- 重置当前块
      map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Stage Buffer' }) -- 暂存整个文件
      map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'Undo Stage' }) -- 撤销暂存
      map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview Hunk' }) -- 预览
      map('n', '<leader>hb', function()
        gitsigns.blame_line { full = true }
      end, { desc = 'Blame Line (Full)' })
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Toggle Blame' }) -- 开关行内blame
      map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Diff This' })
      map('n', '<leader>hD', function()
        gitsigns.diffthis '~'
      end, { desc = 'Diff This ~' })

      -- 文本对象 (方便用 operator 操作，例如 d ih 删除一个 hunk)
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select Hunk' })
    end,
  },
}

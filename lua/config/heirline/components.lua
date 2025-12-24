local conditions = require 'heirline.conditions'
local utils = require 'heirline.utils'
local colors = require('catppuccin.palettes').get_palette 'mocha'
local icons = {
  Error = '●',
  Warn = '●',
  Info = '●',
  Hint = '●',
}

local M = {}

M.Align = { provider = '%=' }
M.Space = { provider = ' ' }
M.Mode = {
  init = function(self)
    self.mode = vim.fn.mode(1) -- :h mode()
  end,
  -- Now we define some dictionaries to map the output of mode() to the
  -- corresponding string and color. We can put these into `static` to compute
  -- them at initialisation time.
  static = {

    mode_names = { -- change the strings if you like it vvvvverbose!
      n = 'N',
      no = 'N?',
      nov = 'N?',
      noV = 'N?',
      ['no\22'] = 'N?',
      niI = 'Ni',
      niR = 'Nr',
      niV = 'Nv',
      nt = 'Nt',
      v = 'V',
      vs = 'Vs',
      V = 'V_',
      Vs = 'Vs',
      ['\22'] = '^V',
      ['\22s'] = '^V',
      s = 'S',
      S = 'S_',
      ['\19'] = '^S',
      i = 'I',
      ic = 'Ic',
      ix = 'Ix',
      R = 'R',
      Rc = 'Rc',
      Rx = 'Rx',
      Rv = 'Rv',
      Rvc = 'Rv',
      Rvx = 'Rv',
      c = 'C',
      cv = 'Ex',
      r = '...',
      rm = 'M',
      ['r?'] = '?',
      ['!'] = '!',
      t = 'T',
    },
    mode_colors = {
      n = colors.pink,
      i = colors.rosewater,
      v = colors.sapphire,
      V = 'cyan',
      ['\22'] = 'cyan',
      c = 'orange',
      s = 'purple',
      S = 'purple',
      ['\19'] = 'purple',
      R = 'orange',
      r = 'orange',
      ['!'] = 'red',
      t = 'red',
    },
  },
  provider = function(self)
    return '󰄛 %2(' .. self.mode_names[self.mode] .. '%)'
  end,
  hl = function(self)
    local mode = self.mode:sub(1, 1) -- get only the first mode character
    return { fg = self.mode_colors[mode], bold = true }
  end,
  update = {
    'ModeChanged',
    pattern = '*:*',
    callback = vim.schedule_wrap(function()
      vim.cmd 'redrawstatus'
    end),
  },
}

M.FileNameBlock = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
}

M.FileIcon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ':e')
    self.icon, self.icon_color = require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    return self.icon and (self.icon .. ' ')
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end,
}

M.FileName = {
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ':.')
    if filename == '' then
      return '[No Name]'
    end
    if not conditions.width_percent_below(#filename, 0.25) then
      filename = vim.fn.pathshorten(filename)
    end
    return filename
  end,
  hl = { fg = utils.get_highlight('Directory').fg },
}

M.FileFlags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = '[+]',
    hl = { fg = colors.green },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = '',
    hl = { fg = colors.blue },
  },
}

M.FileNameModifer = {
  hl = function()
    if vim.bo.modified then
      -- use `force` because we need to override the child's hl foreground
      return { fg = colors.teal, bold = true, force = true }
    end
  end,
}

M.FileNameBlock = utils.insert(
  M.FileNameBlock,
  M.FileIcon,
  utils.insert(M.FileNameModifer, M.FileName), -- a new table where FileName is a child of FileNameModifier
  M.FileFlags,
  { provider = '%<' } -- this means that the statusline is cut here when there's not enough space
)

M.FileType = {
  provider = function()
    return string.upper(vim.bo.filetype)
  end,
  hl = { fg = utils.get_highlight('Type').fg, bold = true },
}

M.FileEncoding = {
  provider = function()
    local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc -- :h 'enc'
    return enc ~= 'utf-8' and enc:upper()
  end,
}

M.FileFormat = {
  provider = function()
    local fmt = vim.bo.fileformat
    return fmt ~= 'unix' and fmt:upper()
  end,
}

M.FileSize = {
  provider = function()
    -- stackoverflow, compute human readable file size
    local suffix = { 'b', 'k', 'M', 'G', 'T', 'P', 'E' }
    local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
    fsize = (fsize < 0 and 0) or fsize
    if fsize < 1024 then
      return fsize .. suffix[1]
    end
    local i = math.floor((math.log(fsize) / math.log(1024)))
    return string.format('%.2g%s', fsize / math.pow(1024, i), suffix[i + 1])
  end,
}

M.FileLastModified = {
  -- did you know? Vim is full of functions!
  provider = function()
    local ftime = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
    return (ftime > 0) and os.date('%c', ftime)
  end,
}

M.Ruler = {
  -- %l = current line number
  -- %L = number of lines in the buffer
  -- %c = column number
  -- %P = percentage through file of displayed window
  provider = '%7(%l/%3L%):%2c %P',
}

M.ScrollBar = {
  static = {
    sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' },
    -- Another variant, because the more choice the better.
    -- sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
  },
  provider = function(self)
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)
    local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
    return string.rep(self.sbar[i], 2)
  end,
  hl = { fg = colors.maroon, bg = colors.base },
}

M.Formatters = {
  condition = function(self)
    local ok, conform = pcall(require, 'conform')
    self.conform = conform
    return ok
  end,
  update = { 'BufEnter' },
  provider = function(self)
    local ft_entry = self.conform.formatters_by_ft[vim.bo.filetype]
    local ft_formatters
    if type(ft_entry) == 'function' then
      ft_formatters = ft_entry()
    else
      ft_formatters = ft_entry
    end
    return ft_formatters and table.concat(ft_formatters, ',') or ''
  end,
  hl = { fg = 'blue', bold = false },
}

M.LSPActive = {
  condition = conditions.lsp_attached,
  update = { 'LspAttach', 'LspDetach' },

  -- You can keep it simple,
  -- provider = " [LSP]",

  -- Or complicate things a bit and get the servers names
  provider = function()
    local names = {}
    for i, server in pairs(vim.lsp.get_clients { bufnr = 0 }) do
      table.insert(names, server.name)
    end
    return ' [' .. table.concat(names, ' ') .. ']'
  end,
  hl = { fg = colors.teal, bold = true },
}

-- M.LSPMessages = {
--   provider = require('lsp-status').status,
--   hl = { fg = 'gray' },
-- }

M.Diagnostics = {
  condition = conditions.has_diagnostics,
  static = {
    error_icon = icons.Error .. ' ',
    warn_icon = icons.Warn .. ' ',
    info_icon = icons.Info .. ' ',
    hint_icon = icons.Hint .. ' ',
  },

  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,
  update = { 'DiagnosticChanged', 'BufEnter' },

  {
    provider = ' ',
  },
  {
    provider = function(self)
      -- 0 is just another output, we can decide to print it or not!
      return self.errors > 0 and (self.error_icon .. self.errors .. ' ')
    end,
    hl = { fg = colors.red },
  },
  {
    provider = function(self)
      return self.warnings > 0 and (self.warn_icon .. self.warnings .. ' ')
    end,
    hl = { fg = colors.yellow },
  },
  {
    provider = function(self)
      return self.info > 0 and (self.info_icon .. self.info .. ' ')
    end,
    hl = { fg = colors.sky },
  },
  {
    provider = function(self)
      return self.hints > 0 and (self.hint_icon .. self.hints)
    end,
    hl = { fg = colors.blue },
  },
  {
    provider = ' ',
  },
}

M.Git = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,

  hl = { fg = 'orange' },

  { -- git branch name
    provider = function(self)
      return ' ' .. self.status_dict.head
    end,
    hl = { bold = true },
  },
  -- You could handle delimiters, icons and counts similar to Diagnostics
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = '(',
  },
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and ('+' .. count)
    end,
    hl = { fg = 'git_add' },
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and ('-' .. count)
    end,
    hl = { fg = 'git_del' },
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and ('~' .. count)
    end,
    hl = { fg = 'git_change' },
  },
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = ')',
  },
}

M.HelpFileName = {
  condition = function()
    return vim.bo.filetype == 'help'
  end,
  provider = function()
    local filename = vim.api.nvim_buf_get_name(0)
    return vim.fn.fnamemodify(filename, ':t')
  end,
  hl = { fg = colors.blue },
}

M.SearchCount = {
  condition = function()
    return vim.v.hlsearch ~= 0 and vim.o.cmdheight == 0
  end,
  init = function(self)
    local ok, search = pcall(vim.fn.searchcount)
    if ok and search.total then
      self.search = search
    end
  end,
  provider = function(self)
    local search = self.search
    return string.format('[%d/%d]', search.current, math.min(search.total, search.maxcount))
  end,
}

M.MacroRec = {
  condition = function()
    return vim.fn.reg_recording() ~= '' and vim.o.cmdheight == 0
  end,
  provider = ' ',
  hl = { fg = 'orange', bold = true },
  utils.surround({ '[', ']' }, nil, {
    provider = function()
      return vim.fn.reg_recording()
    end,
    hl = { fg = 'green', bold = true },
  }),
  update = {
    'RecordingEnter',
    'RecordingLeave',
  },
}

vim.opt.showcmdloc = 'statusline'
M.ShowCmd = {
  condition = function()
    return vim.o.cmdheight == 0
  end,
  provider = ':%3.5(%S%)',
}

M.WinBars = {
  fallthrough = false,
  { -- A special winbar for terminals
    condition = function()
      return conditions.buffer_matches { buftype = { 'terminal' } }
    end,
    utils.surround({ '', '' }, colors.maroon, {
      M.FileType,
      M.Space,
      M.TerminalName,
    }),
  },
  { -- An inactive winbar for regular files
    condition = function()
      return not conditions.is_active()
    end,
    utils.surround({ '', '' }, colors.base, { hl = { fg = colors.surface0, force = true }, M.FileNameBlock }),
  },
  -- A winbar for regular files
  utils.surround({ '', '' }, colors.surface1, M.FileNameBlock),
}

return M

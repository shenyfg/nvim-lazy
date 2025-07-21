local autocmd = vim.api.nvim_create_autocmd

-- Auto save
autocmd({ "TextChanged", "TextChangedI" }, {
  pattern = "*.*",
  callback = function()
    local bt = vim.bo.buftype
    local ft = vim.bo.filetype

    if bt == "terminal" or bt == "prompt" or bt == "nofile" then
      return
    end

    if ft == "TelescopePrompt" or ft == "lazy" then
      return
    end

    vim.cmd("silent! write")
  end,
})

-- Auto refresh when file is changed by outside apps like claude code
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})
-- 文件外部变动后提示
autocmd({ "FileChangedShellPost" }, {
  pattern = "*",
  command = [[echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None]],
})

-- Python --
autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.makeprg = "time python3 %"
  end,
})

-- Text --
autocmd("FileType", {
  pattern = "text",
  callback = function()
    vim.opt_local.spell = false
    vim.bo.makeprg = "time python3 ./a.py"
  end,
})

-- Lua --
autocmd("FileType", {
  pattern = "lua",
  callback = function()
    -- Disable auto fill in comment of next line
    -- https://github.com/LazyVim/LazyVim/discussions/3018
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

-- Markdown --
autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = false
    vim.diagnostic.enable(false)
  end,
})

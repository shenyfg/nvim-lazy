-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local g = vim.g
local opt = vim.opt

-- Disable autoformat
g.autoformat = false

-- Disable animations
-- g.snacks_animate = false

-- Disable default slow undo
opt.undofile = false
opt.undolevels = 1000

-- Disable mouse, because of the alttab switching issue
-- opt.mouse = ""

-- Disable shining cursorline
opt.cursorlineopt = "number"

-- Disable showing spaces
opt.list = false

opt.completeopt = "menu,preview"

-- set fold to default
opt.foldtext = "foldtext()"
opt.foldmethod = "indent"
opt.fillchars = {
  fold = "·",
  foldopen = "-",
  foldclose = "+",
  foldsep = "|",
  diff = "-",
  eob = "~",
}

opt.formatoptions = "jcqlnt"

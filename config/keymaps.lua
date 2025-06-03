-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del
local opts = { noremap = true, silent = true, nowait = true }

-- Delete default lazyvim mappings
del("n", "<leader>l", { desc = "Lazy" })
del("n", "<leader>L", { desc = "LazyVim Changelog" })
del("n", "<leader><tab><tab>", { desc = "New Tab" })
del({ "n", "i", "v" }, "<A-j>", { desc = "Move Down" })
del({ "n", "i", "v" }, "<A-k>", { desc = "Move Up" })
del({ "i", "x", "n", "s" }, "<C-s>", { desc = "Save File" })
del({ "n", "x", "o" }, "n", { desc = "DO NOT CHANGE MY SEARCHING BEHAVIOUR!" })
del({ "n", "x", "o" }, "N", { desc = "DO NOT CHANGE MY SEARCHING BEHAVIOUR!" })
del("n", "<S-h>", { desc = "Prev Buffer" })
del("n", "<S-l>", { desc = "Next Buffer" })

-- Lazy
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>E", "<cmd>LazyExtras<cr>", { desc = "LazyExtras" })

-- Code format
map({ "n", "v" }, "<leader>lf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

map({ "n", "i", "v" }, "<C-/>", function()
  Snacks.terminal("bash")
end, { desc = "which_key_ignore" })

map({ "n", "i", "v" }, "<C-\\>", function()
  Snacks.terminal("bash")
end, { desc = "which_key_ignore" })
map("t", "<C-\\>", "<cmd>close<cr>", { desc = "which_key_ignore" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "which_key_ignore" })

-- Windows remap
map("n", "<C-=>", "<C-w>=", { desc = "Make all windows (almost) equally high and wide" })
map("n", "<C-->", "<C-w>|", { desc = "Set current window width to N (default: widest possible)." })

-- Make
map("n", "<C-'>", "<cmd>make<CR>", { desc = "Make command" })

-- Create a new tab
map("n", "<leader><tab>c", "<cmd>tabe %<cr>", { desc = "New Tab" })

-- After yank, keep the copied content in register
map("x", "p", "pgvy", opts)

-- Autocomplete in command line mode
map("c", "<C-p>", "<Up>")
map("c", "<C-n>", "<Down>")

-- Map H and L to ^ and $h (skip the extra space on the end)
-- Map with normal mode, operator-pending mode and visual mode
map({ "n", "o", "x" }, "H", "^", opts)
map("n", "L", "$", opts)
map({ "o", "x" }, "L", "$h", opts)

-- Quickly change left to right
map({ "n", "v" }, "<leader>lr", ":s/left/right/g<CR>:noh<CR>", { desc = "Change lefts to rights" })

-- Map C-xC-l to C-l in Insert mode
map({ "i" }, "<C-l>", "<C-x><C-l>", { desc = "Line Compeletion in insert mode" })

-- Leetcode context mapping
map({ "n" }, "<leader>dl", ":%s/©leetcode//g<CR>", { desc = "Delete leetcode watermark" })

-- Shortcuts for `Till` operations
map("n", "c ", "ct ", opts)
map("n", "c,", "ct,", opts)
map("n", "c.", "ct.", opts)
map("n", "c)", "ct)", opts)
map("n", "c}", "ct}", opts)
map("n", "c]", "ct]", opts)
map("n", "c>", "ct>", opts)
map("n", 'c"', 'ct"', opts)
map("n", "c'", "ct'", opts)
map("n", "c;", "ct;", opts)
map("n", "c:", "ct:", opts)
map("n", "c_", "ct_", opts)
map("n", "c-", "ct-", opts)

map("n", "d ", "df ", opts)
map("n", "d,", "dt,", opts)
map("n", "d.", "dt.", opts)
map("n", "d)", "dt)", opts)
map("n", "d}", "dt}", opts)
map("n", "d]", "dt]", opts)
map("n", "d>", "dt>", opts)
map("n", 'd"', 'dt"', opts)
map("n", "d'", "dt'", opts)
map("n", "d;", "dt;", opts)
map("n", "d:", "dt:", opts)
map("n", "d_", "dt_", opts)
map("n", "d-", "dt-", opts)

local opts = { noremap = true, silent = true }

local map = vim.keymap.set

map("n", "<C-l>", vim.cmd.Ex)
map("n", "Q", "<Nop>")

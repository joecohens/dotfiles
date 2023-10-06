local builtin = require("telescope.builtin")

local map = vim.keymap.set

map("n", "<C-p>", builtin.find_files, {})
map("n", "<C-s>", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
map("n", "<leader>vh", builtin.help_tags, {})


return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    enabled = true,
    opts = {},
    config = function()
        local exclude_ft = { "help", "git", "markdown", "snippets", "text", "gitconfig", "alpha", "dashboard" }

        require("ibl").setup {
            indent = {
                -- -- U+2502 may also be a good choice, it will be on the middle of cursor.
                -- -- U+250A is also a good choice
                char = "|",
            },
            scope = {
                show_start = false,
                show_end = false,
            },
            exclude = {
                filetypes = exclude_ft,
                buftypes = { "terminal" },
            },
        }
    end,
}

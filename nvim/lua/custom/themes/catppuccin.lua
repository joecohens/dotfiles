return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      integrations = {
        cmp = true,
        gitsigns = true,
        treesitter = true,
        notify = true,
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}

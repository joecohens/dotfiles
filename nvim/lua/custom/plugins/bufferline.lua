return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      mode = "buffers",
      max_name_length = 26,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = true,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left",
          separators = true,
        },
      },
    },
  },
}

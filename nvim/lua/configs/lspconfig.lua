-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = {
  "ts_ls",
  "html",
  "gopls",
  "intelephense",
}

vim.lsp.enable(servers)

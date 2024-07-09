return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      local conf = require "nvchad.configs.nvimtree"
      conf.view.side = "right"

      return conf
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "lua-language-server",
        "rust-analyzer",
        "intelephense",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "gopls",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "php",
        "go",
        "tsx",
        "typescript",
        "javascript",
      },
    },
  },

  -- custom plugins
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup()
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux",
    },
    keys = {
      { "<leader>t", "<cmd>TestNearest<CR>" },
      { "<leader>T", "<cmd>TestFile<CR>" },
      { "<leader>a", "<cmd>TestSuite<CR>" },
      { "<leader>l", "<cmd>TestLast<CR>" },
      { "<leader>g", "<cmd>TestVisit<CR>" },
    },
    config = function()
      vim.cmd "let test#strategy = 'vimux'"
    end,
  },
}

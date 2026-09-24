return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css",
        "cpp", "c",
      },
    },
  },

  -- Debugger
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },

  -- CMake
  {
    "Civitasv/cmake-tools.nvim",
    config = function()
      require("cmake-tools").setup({ cmake_build_directory = "build" })
    end,
  },

  -- Better diagnostics
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup()
    end,
  },

  -- clangd extras
  {
    "p00f/clangd_extensions.nvim",
    config = function()
      require("clangd_extensions").setup()
    end,
  },

  -- Live rename preview
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },

  -- File bookmarks
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
      local map = vim.keymap.set
      map("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add file" })
      map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })
      map("n", "<C-1>", function() harpoon:list():select(1) end)
      map("n", "<C-2>", function() harpoon:list():select(2) end)
      map("n", "<C-3>", function() harpoon:list():select(3) end)
      map("n", "<C-4>", function() harpoon:list():select(4) end)
    end,
  },

  -- Better % matching
  { "andymass/vim-matchup" },
}
return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "antosha417/nvim-lsp-file-operations" },
    opts = require "configs.nvim-tree",
    config = function(_, opts)
      require("nvim-tree").setup(opts)
      require("nvim-tree.diagnostics").update()
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup {}
    end,
  },

  {
    "nvchad/nvcommunity",
    { import = "nvcommunity.git.lazygit" },
  },

  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
      require "configs.neorg"
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require "configs.lspsaga"
    end,
    event = "LspAttach",
  },

  {
    "b0o/incline.nvim",
    config = function()
      require "configs.incline-conf"
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "BufRead",
    config = function()
      require("hlslens").setup()
      require "configs.hlslens-conf"

      local kopts = { noremap = true, silent = true }

      vim.api.nvim_set_keymap(
        "n",
        "n",
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts
      )
      vim.api.nvim_set_keymap(
        "n",
        "N",
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts
      )
      vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

      vim.api.nvim_set_keymap("n", "<leader>lo", "<Cmd>noh<CR>", kopts)
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require "configs.fidget"
    end,
    event = "BufRead",
  },
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require "configs.copilot"
    end,
    event = "BufRead",
  },
  {
    "hrsh7th/nvim-cmp",
    opts = require "configs.nvim-cmp",
  },
}

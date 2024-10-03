-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "nightfox",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.ui = {
  cmp = {
    icons = true,
    style = "atom",
    selected_item_bg = "simple",
  },

  nvdash = {
    load_on_startup = true,
    header = {
      [[      ____                ]],
      [[     /___/\_              ]],
      [[    _\   \/_/\__          ]],
      [[  __\       \/_/\         ]],
      [[  \   __    __ \ \        ]],
      [[ __\  \_\   \_\ \ \   __  ]],
      [[/_/\\   __   __  \ \_/_/\ ]],
      [[\_\/_\__\/\__\/\__\/_\_\/ ]],
      [[   \_\/_/\       /_\_\/   ]],
      [[      \_\/       \_\/     ]],
    },
  },

  telescope = {
    style = "bordered",
  },
}

M.mason = {
  pkgs = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    -- "deno", -- NOTE: maybe in the future
    "prettier",
    "emmet-language-server",
    "json-lsp",
    -- "phpactor",
    "tailwindcss-language-server",
    "marksman",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

return M

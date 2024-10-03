-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tundra",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.ui = {
  cmp = {
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      tailwind = true,
    },
  },

  telescope = {
    style = "bordered",
  },
}

M.nvdash = {
  load_on_startup = true,
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

-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local on_attach = require("utils.lsp").on_attach

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "clangd",
  "emmet_language_server",
  "jsonls",
  "tailwindcss",
  "marksman",
  "ts_ls",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
  settings = {
    intelephense = {
      stubs = {
        "bcmath",
        "bz2",
        "calendar",
        "Core",
        "curl",
        "zip",
        "zlib",
        "wordpress",
        "woocommerce",
        "acf-pro",
        "wordpress-globals",
        "wp-cli",
        "genesis",
        "polylang",
      },
      environment = {
        includePaths = "/home/your-user/.composer/vendor/php-stubs/", -- this line forces the composer path for the stubs in case inteliphense don't find it...
      },
      files = {
        maxSize = 5000000,
      },
    },
  },
}

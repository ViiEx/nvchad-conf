local status_ok, norg = pcall(require, "norg")

if not status_ok then
  return
end

local opts = {
  load = {
    ["core.defaults"] = {},
    ["core.itero"] = {},
    ["core.keybinds"] = {},
    ["core.norg.concealer"] = {},
    ["core.concealer"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          notes = "~/notes",
        },
        default_workspace = "notes",
      },
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.export"] = {},
    ["core.export.markdown"] = {
      config = {
        extensions = "all",
      },
    },
  },
}

norg.setup(opts)

vim.wo.foldlevel = 99
vim.wo.conceallevel = 2

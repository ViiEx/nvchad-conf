local status_ok, neorg = pcall(require, "neorg")

if not status_ok then
  return
end

local opts = {
  load = {
    ["core.defaults"] = {},
    ["core.clipboard.code-blocks"] = {},
    ["core.esupports.indent"] = {},
    ["core.esupports.metagen"] = {
      config = {
        author = "Vasilis Christopoulos",
        type = "auto",
      },
    },
    ["core.journal"] = {},
    ["core.pivot"] = {},
    ["core.qol.toc"] = {},
    ["core.qol.todo_items"] = {},
    ["core.todo-introspector"] = {},
    ["core.itero"] = {},
    ["core.keybinds"] = {},
    ["core.concealer"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          notes = "~/notes",
        },
        default_workspace = "notes",
      },
    },
    ["core.dirman.utils"] = {},
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.integrations.nvim-cmp"] = {},
    ["core.export"] = {},
    ["core.export.markdown"] = {
      config = {
        extensions = "all",
      },
    },
    ["core.neorgcmd"] = {},
    ["core.highlights"] = {},
    ["core.autocommands"] = {},
    ["core.integrations.treesitter"] = {},
  },
}

neorg.setup(opts)

vim.wo.foldlevel = 99
vim.wo.conceallevel = 2

local status_ok, package_info = pcall(require, "package-info")

if not status_ok then
  return
end

local opts = {
  colors = {
    up_to_date = "#3C4048", -- Text color for up to date dependency virtual text
    outdated = "#d19a66", -- Text color for outdated dependency virtual text
  },
  icons = {
    enable = true, -- Whether to display icons
    style = {
      up_to_date = "|  ", -- Icon for up to date dependencies
      outdated = "|  ", -- Icon for outdated dependencies
    },
  },
  autostart = true, -- Whether to autostart when `package.json` is opened
  hide_up_to_date = false, -- It hides up to date versions when displaying virtual text
  hide_unstable_versions = false, -- It hides unstable versions from version list e.g next-11.1.3-canary3
  -- Can be `npm`, `yarn`, or `pnpm`. Used for `delete`, `install` etc...
  -- The plugin will try to auto-detect the package manager based on
  -- `yarn.lock` or `package-lock.json`. If none are found it will use the
  -- provided one, if nothing is provided it will use `yarn`
  package_manager = "yarn",
}

-- Show dependency versions
vim.keymap.set({ "n" }, "<LEADER>ps", require("package-info").show, { silent = true, noremap = true })

-- Hide dependency versions
vim.keymap.set({ "n" }, "<LEADER>ph", require("package-info").hide, { silent = true, noremap = true })

-- Toggle dependency versions
vim.keymap.set({ "n" }, "<LEADER>pv", require("package-info").toggle, { silent = true, noremap = true })

-- Update dependency on the line
vim.keymap.set({ "n" }, "<LEADER>pu", require("package-info").update, { silent = true, noremap = true })

-- Delete dependency on the line
vim.keymap.set({ "n" }, "<LEADER>pd", require("package-info").delete, { silent = true, noremap = true })

-- Install a new dependency
vim.keymap.set({ "n" }, "<LEADER>pi", require("package-info").install, { silent = true, noremap = true })

-- Install a different dependency version
vim.keymap.set({ "n" }, "<LEADER>pp", require("package-info").change_version, { silent = true, noremap = true })

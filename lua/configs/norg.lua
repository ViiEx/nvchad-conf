local status_ok, neorg = pcall(require, "neorg")

if not status_ok then
	return
end

local opts = {
	load = {
		["core.defaults"] = {},
		["core.itero"] = {},
		["core.keybinds"] = {},
		-- ["core.neorg.concealer"] = {},
		["core.concealer"] = {},
		["core.dirman"] = {
			config = {
				workspaces = {
					notes = "~/notes",
				},
				default_workspace = "notes",
			},
		},
		["core.completion"] = {
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
		["core.neorgcmd"] = {},
		["core.highlights"] = {},
		["core.autocommands"] = {},
		["core.integrations.treesitter"] = {},
	},
}

neorg.setup(opts)

vim.wo.foldlevel = 99
vim.wo.conceallevel = 2

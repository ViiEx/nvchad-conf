---@type ChadrcConfig
local M = {}

local core = require("utils.core")

-- Path to overriding theme and highlights files
local highlights = require("highlights")
M.ui = {
	theme = "nightfox",
	theme_toggle = { "nightfox", "one_light" },

	lsp_semantic_tokens = false,

	hl_override = highlights.override,
	hl_add = highlights.add,

	statusline = core.statusline,

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
		style = "borderless",
	},
}

M.base46 = {
	integrations = {
		"blankline",
		"cmp",
		"defaults",
		"devicons",
		"git",
		"lsp",
		"mason",
		"nvcheatsheet",
		"nvdash",
		"nvimtree",
		"statusline",
		"syntax",
		"tbline",
		"telescope",
		"whichkey",
		"dap",
		"hop",
		"treesitter",
		"rainbowdelimiters",
		"todo",
		"trouble",
		"notify",
	},
}

return M

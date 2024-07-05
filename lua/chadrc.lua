---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("highlights")
M.ui = {
	theme = "nightfox",
	theme_toggle = { "nightfox", "one_light" },

	hl_override = highlights.override,
	hl_add = highlights.add,

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

	statusline = {
		-- order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" }, -- default
		order = {
			"mode",
			"file",
			"record_macro",
			"diagnostics",
			"git",
			"%=",
			"lsp_msg",
			"%=",
			"lsp",
			"copilot",
			"cursor",
			"cwd",
		}, -- vscode style
		modules = {
			copilot = function()
				--- @diagnostic disable: deprecated
				for _, client in pairs(vim.lsp.get_active_clients()) do
					if client.name == "copilot" then
						return "%#TeSTTCopilot#" .. "   "
					end
				end
				return "%#TeSTTCopilot#" .. "   "
			end,

			record_macro = function()
				if require("noice").api.statusline.mode.get() then
					return "  " .. vim.fn.reg_recording()
				end
			end,
		},
		theme = "vscode_colored",
	},

	telescope = {
		style = "borderless",
	},
}

return M

---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("highlights")

M.ui = {
	theme = "yoru",
	theme_toggle = { "yoru", "one_light" },

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
			"                                   ",
			"   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
			"    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
			"          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
			"           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
			"          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
			"   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
			"  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
			" ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
			" ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
			"      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
			"       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
			"                                   ",
		},
	},

	statusline = {
		-- order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" }, -- default
		order = { "mode", "file", "diagnostics", "git", "%=", "lsp_msg", "%=", "lsp", "copilot", "cursor", "cwd" }, -- vscode style
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
		},
		theme = "vscode_colored",
	},

	telescope = {
		style = "borderless",
	},
}

-- M.plugins = "plugins"

-- check core.mappings for table structure
-- M.mappings = require "mappings"
return M

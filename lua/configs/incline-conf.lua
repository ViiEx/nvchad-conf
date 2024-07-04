local status_ok, incline = pcall(require, "incline")

if not status_ok then
	return
end

local helpers = require("incline.helpers")
local devicons = require("nvim-web-devicons")

local get_theme_tb = require("base46").get_theme_tb
local colors = get_theme_tb("base_30")

local opts = {
	window = {
		padding = 0,
		margin = { horizontal = 0 },
	},
	render = function(props)
		local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
		if filename == "" then
			filename = "[No Name]"
		end
		local ft_icon, ft_color = devicons.get_icon_color(filename)
		local modified = vim.bo[props.buf].modified
		return {
			ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
			" ",
			{ filename, gui = modified and "bold,italic" or "bold" },
			" ",
			guibg = colors.darker_black,
		}
	end,
}

incline.setup(opts)

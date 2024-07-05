return {
	{
		"echasnovski/mini.nvim",
		version = false,
		event = "BufReadPre",
		config = function()
			local get_theme_tb = require("base46").get_theme_tb
			local colors = get_theme_tb("base_30")
			vim.api.nvim_set_hl(0, "MiniNotifyNormal", { bg = colors.black })
			require("mini.notify").setup({
				window = {
					winblend = 10,
					max_width_share = 0.45,
				},
			})
		end,
	},
}

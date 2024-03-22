return {
	{
		"vuki656/package-info.nvim",
		event = "BufRead",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("configs.package-info")
		end,
	},
}

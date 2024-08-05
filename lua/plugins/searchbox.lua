return {
	{
		"VonHeikemen/searchbox.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		event = "BufRead",
		opts = {
			popup = {
				relative = "win",
				position = {
					row = "5%",
					col = "95%",
				},
				size = 30,
				border = {
					style = "rounded",
					text = {
						top = " Search ",
						top_align = "left",
					},
				},
				win_options = {
					winhighlight = "Normal:Normal,FloatBorder:CmpBorder",
				},
			},
		},
	},
}

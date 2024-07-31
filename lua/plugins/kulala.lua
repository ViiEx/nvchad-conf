return {
	{
		"mistweaverco/kulala.nvim",
		ft = { "http" },
		opts = {
			inlay = {
				loading_icon = "",
				done_icon = "",
			},
		},
		config = function(_, opts)
			-- Setup is required, even if you don't pass any options
			require("kulala").setup(opts)
		end,
	},
}

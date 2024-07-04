return {
	{
		"b0o/incline.nvim",
		config = function()
			require("configs.incline-conf")
		end,
		-- Optional: Lazy load Incline
		event = "VeryLazy",
	},
}

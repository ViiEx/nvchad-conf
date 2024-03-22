return {
	{
		"tzachar/local-highlight.nvim",
		event = "BufRead",
		config = function()
			require("local-highlight").setup()
		end,
	},
}

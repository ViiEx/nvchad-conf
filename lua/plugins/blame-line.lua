return {
	{
		"braxtons12/blame_line.nvim",
		event = "BufRead",
		config = function()
			require("blame_line").enable()
		end,
	},
}

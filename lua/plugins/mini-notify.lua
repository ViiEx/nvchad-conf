return {
	{
		"echasnovski/mini.nvim",
		version = false,
		event = "BufReadPre",
		config = function()
			require("mini.notify").setup({
				window = {
					winblend = 10,
					max_width_share = 0.45,
				},
			})
		end,
	},
}

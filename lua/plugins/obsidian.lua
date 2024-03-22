return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		ft = "markdown",
		config = function()
			require("configs.obsidian")
		end,
	},
}

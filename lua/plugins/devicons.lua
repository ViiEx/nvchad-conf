local overrides = require("configs.overrides")

return {
	{
		"nvim-tree/nvim-web-devicons",
		dependencies = {
			"rachartier/tiny-devicons-auto-colors.nvim",
		},
		opts = overrides.devicons,
	},
}

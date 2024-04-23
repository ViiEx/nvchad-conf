local overrides = require("configs.overrides")

return {
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("configs.mason-lspconfig")
		end,
	},
}

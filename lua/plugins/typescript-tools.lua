return {
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		event = "LspAttach",
		config = function()
			require("configs.typescript")
		end,
	},
}

return {
	{
		"andrewferrier/debugprint.nvim",
		keys = { "<leader><leader>p" },
		config = function()
			require("debugprint").setup({
				create_keymaps = false,
				create_commands = false,
			})
		end,
	},
}

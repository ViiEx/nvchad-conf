return {
	{
		"nvim-neotest/neotest",
		ft = { "go", "javascript", "typescript", "javascriptreact", "typescriptreact" },
		dependencies = {
			"nvim-neotest/neotest-go",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			---@diagnostic disable-next-line: different-requires
			require("configs.neotest")
		end,
	},
}

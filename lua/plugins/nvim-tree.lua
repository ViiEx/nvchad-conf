return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "antosha417/nvim-lsp-file-operations" },
		opts = require("configs.nvimtree"),
		config = function(_, opts)
			require("nvim-tree").setup(opts)
			require("nvim-tree.diagnostics").update()
		end,
	},
}

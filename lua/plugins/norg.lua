return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
		config = true,
		event = "VimEnter",
	},
	{
		"nvim-neorg/neorg",
		dependencies = { "luarocks.nvim" },
		lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		version = "*", -- Pin Neorg to the latest stable release
		config = function()
			require("configs.norg")
		end,
	},
}

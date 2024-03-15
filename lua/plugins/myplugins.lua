local overrides = require("configs.overrides")

local plugins = {

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"nvim-telescope/telescope.nvim",
		opts = {
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
				file_browser = {
					grouped = true,
				},
			},
		},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			scope = { enabled = false },
		},
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		opts = {
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "path" },
				{ name = "emoji" },
			},
		},
	},

	{
		"mg979/vim-visual-multi",
		lazy = false,
	},

	{
		"NvChad/nvcommunity",
		{ import = "nvcommunity.git.lazygit" },
	},

	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("configs.lspsaga")
		end,
		event = "LspAttach",
	},

	{
		"j-hui/fidget.nvim",
		config = function()
			require("configs.fidget")
		end,
		event = "BufRead",
	},

	{
		"zbirenbaum/copilot.lua",
		event = "VeryLazy",
		config = function()
			require("configs.copilot")
		end,
	},

	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("configs.noice")
		end,
	},

	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
		dependencies = {
			"folke/noice.nvim",
		},
		event = "LspAttach",
	},

	{
		"windwp/nvim-ts-autotag",
		config = true,
		event = "InsertEnter",
	},

	{
		"kylechui/nvim-surround",
		config = true,
		event = "InsertEnter",
	},

	{
		"kwkarlwang/bufresize.nvim",
		config = function()
			require("configs.bufresize")
		end,
	},

	{ "nvim-treesitter/nvim-treesitter-angular" },

	{
		"hrsh7th/cmp-emoji",
		event = "InsertEnter",
	},

	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6", --recomended as each new version will have breaking changes
	},

	{
		"LudoPinelli/comment-box.nvim",
		event = "BufRead",
	},

	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup({})
		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		event = "LspAttach",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("ui-select")
		end,
	},

	{
		"sindrets/diffview.nvim",
		event = "BufRead",
	},

	{
		"tzachar/local-highlight.nvim",
		event = "BufRead",
		config = function()
			require("local-highlight").setup()
		end,
	},

	{
		"vuki656/package-info.nvim",
		event = "BufRead",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("configs.package-info")
		end,
	},

	-- Blame line plugin
	{
		"braxtons12/blame_line.nvim",
		event = "BufRead",
		config = function()
			require("blame_line").enable()
		end,
	},

	{
		"epwalsh/obsidian.nvim",
		version = "*",
		ft = "markdown",
		config = function()
			require("configs.obsidian")
		end,
	},

	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		event = "LspAttach",
		config = function()
			require("configs.typescript")
		end,
	},

	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").load_extension("file_browser")
		end,
		event = "VimEnter",
	},

	-- Copilot Chat v2
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		config = function()
			require("configs.copilot-chat")
		end,
		event = "InsertEnter",
	},
}

return plugins

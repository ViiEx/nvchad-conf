return {
	{
		"hrsh7th/nvim-cmp",
		opts = {
			window = {
				completion = {
					scrolloff = 0,
					col_offset = 0,
					scrollbar = false,
					border = {
						{ "󱐋", "WarningMsg" },
						{ "─", "Comment" },
						{ "╮", "Comment" },
						{ "│", "Comment" },
						{ "╯", "Comment" },
						{ "─", "Comment" },
						{ "╰", "Comment" },
						{ "│", "Comment" },
					},
				},
				documentation = {
					border = {
						{ "", "DiagnosticHint" },
						{ "─", "Comment" },
						{ "╮", "Comment" },
						{ "│", "Comment" },
						{ "╯", "Comment" },
						{ "─", "Comment" },
						{ "╰", "Comment" },
						{ "│", "Comment" },
					},
					scrollbar = false,
				},
			},
			sources = {
				{
					name = "cmp_tabnine",
					max_item_count = 2,
				},
				{ name = "nvim_lsp", keyword_length = 2 },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "path" },
				{ name = "emoji" },
				{
					name = "ctags",
					option = {
						executable = "ctags",
						trigger_characters = { "." },
					},
					keyword_length = 5,
					max_item_count = 2,
				},
				{ name = "treesitter" },
				{ name = "nvim_lsp_document_symbol" },
				{ name = "luasnip_choice" },
			},
		},
		dependencies = {
			"delphinus/cmp-ctags",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"ray-x/cmp-treesitter",
			"rcarriga/cmp-dap",
			"js-everts/cmp-tailwind-colors",
			{
				"tzachar/cmp-tabnine",
				build = "./install.sh",
				config = function()
					local tabnine = require("cmp_tabnine.config")
					tabnine:setup({
						max_lines = 1000,
						max_num_results = 3,
						sort = true,
						show_prediction_strength = false,
						run_on_every_keystroke = true,
						snipper_placeholder = "..",
						ignored_file_types = {},
					})
				end,
			},
		},
	},
}

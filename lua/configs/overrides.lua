local M = {}

local function icon_multiple_filenames(filenames, opts)
	local overrides = {}
	for _, file in ipairs(filenames) do
		overrides[file] = opts
	end
	return overrides
end

local function filenames_list(filename, extensions)
	local filenames = {}
	for _, ext in ipairs(extensions) do
		table.insert(filenames, filename .. "." .. ext)
	end
	return filenames
end

M.treesitter = {
	sync_install = true,
	auto_install = true,
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"svelte",
		"vue",
		"php",
		"glimmer",
		"rescript",
		"embedded_template",
		-- "markdown",
		-- "markdown_inline",
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
	highlight = {
		enable = true,
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		-- "deno", -- NOTE: maybe in the future
		"prettier",
		"emmet-language-server",
		"json-lsp",
		-- "phpactor",
		"tailwindcss-language-server",
		"marksman",

		-- c/cpp stuff
		"clangd",
		"clang-format",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
		ignore = false,
	},

	renderer = {
		root_folder_label = ":t",
		highlight_git = true,
		icons = {
			show = {
				git = false,
			},
		},
	},
}

M.devicons = {
	override_by_filename = vim.tbl_extend(
		"force",
		{
			["yml"] = {
				icon = "",
				color = "#EF9C66",
				name = "Yml",
			},
			["yaml"] = {
				icon = "",
				color = "#EF9C66",
				name = "Yaml",
			},
			["scm"] = {
				icon = "",
				color = "#90a850",
				name = "Query",
			},
			["makefile"] = {
				icon = "",
				color = "#f1502f",
				name = "Makefile",
			},
			["mod"] = {
				icon = "󰟓",
				color = "#519aba",
				name = "Mod",
			},
			["yarn.lock"] = {
				icon = "",
				color = "#0288D1",
				name = "Yarn",
			},
			["sum"] = {
				icon = "󰟓",
				color = "#cbcb40",
				name = "Sum",
			},
			[".gitignore"] = {
				icon = "",
				color = "#e24329",
				name = "GitIgnore",
			},
			["js"] = {
				icon = "",
				color = "#cbcb41",
				name = "Js",
			},
			["lock"] = {
				icon = "",
				color = "#bbbbbb",
				name = "Lock",
			},
			["package.json"] = {
				icon = "",
				color = "#e8274b",
				name = "PackageJson",
			},
			[".eslintignore"] = {
				icon = "󰱺",
				color = "#e8274b",
				name = "EslintIgnore",
			},
			["tags"] = {
				icon = "",
				color = "#bbbbbb",
				name = "Tags",
			},
			["http"] = {
				icon = "󰖟",
				color = "#519aba",
				name = "Http",
			},
			["astro"] = {
				icon = "",
				color = "#f1502f",
				name = "Astro",
			},
		},
		icon_multiple_filenames(filenames_list("tailwind.config", { "js", "cjs", "ts", "cts" }), {
			icon = "󱏿",
			color = "#4DB6AC",
			name = "tailwind",
		}),
		icon_multiple_filenames(filenames_list("vite.config", { "js", "cjs", "ts", "cts" }), {
			icon = "󱐋",
			color = "#FFAB00",
			name = "ViteJS",
		}),
		icon_multiple_filenames(filenames_list(".eslintrc", { "js", "cjs", "yaml", "yml", "json" }), {
			icon = "",
			color = "#4b32c3",
			cterm_color = "56",
			name = "Eslintrc",
		})
	),
}

return M

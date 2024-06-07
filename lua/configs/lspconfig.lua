local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
	print("‼ Tried loading lspconfig ... unsuccessfully.")
	return status_ok
end

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local on_init = require("nvchad.configs.lspconfig").on_init

-- if you just want default config for the servers then put them in a table
local servers = {
	"html",
	"cssls",
	"clangd",
	"emmet_language_server",
	"jsonls",
	"phpactor",
	"tailwindcss",
	"marksman",
	"tsserver",
}

-- lua config for lua_ls
lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	on_init = on_init,

	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types"] = true,
					[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})

local signs = {
	Error = "🤬",
	Warn = "😤",
	Info = "🤔",
	Hint = "🤯",
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- https://neovim.io/doc/user/diagnostic.html#diagnostic-api
vim.diagnostic.config({
	underline = false,
	virtual_text = false,
})

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		-- on_init = on_init,
	})
end

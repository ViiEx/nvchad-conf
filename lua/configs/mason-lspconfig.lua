local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")

if not status_ok then
	return
end

mason_lspconfig.setup({
	ensure_installed = {
		"html",
		"cssls",
		"clangd",
		"emmet_language_server",
		"jsonls",
		"phpactor",
		"tailwindcss",
		"marksman",
		"tsserver",
	},

	automatic_installation = false,
})

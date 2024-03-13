local status_ok, ts = pcall(require, "typescript")

if not status_ok then
	return
end

local capabilities = require("nvchad.configs.lspconfig").capabilities

ts.setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	go_to_source_definition = {
		fallback = true, -- fall back to standard LSP definition on failure
	},
	server = {
		on_attach = function(client, bufnr)
			if client.server_capabilities.signatureHelpProvider then
				require("nvchad.signature").setup(client)
			end

			if
				not utils.load_config().ui.lsp_semantic_tokens and client.supports_method("textDocument/semanticTokens")
			then
				client.server_capabilities.semanticTokensProvider = nil
			end
		end,
		capabilities = capabilities,
	},
})

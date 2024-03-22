local status_ok, ts = pcall(require, "typescript-tools")

if not status_ok then
	return
end

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local on_init = require("nvchad.configs.lspconfig").on_init

ts.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	on_init = on_init,
	settings = {
		expose_as_code_action = "all",
	},
})

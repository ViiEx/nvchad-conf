return {
	{
		"mfussenegger/nvim-dap",
		cmd = { "DapContinue", "DapStepOver", "DapStepInto", "DapStepOut", "DapToggleBreakpoint" },
		dependencies = {
			{
				"theHamsta/nvim-dap-virtual-text",
				config = function()
					require("nvim-dap-virtual-text").setup({
						highlight_changed_variables = true,
						virt_text_pos = "eol",
						highlight_new_as_changed = true,
						show_stop_reason = true,
						commented = true,
						-- Hides tokens, secrets, and other sensitive information
						-- display_callback = function(variable)
						--   local name = string.lower(variable.name)
						--   local value = string.lower(variable.value)
						--   if name:match "secret" or name:match "api" or value:match "secret" or value:match "api" then
						--     return "*****"
						--   end

						--   if #variable.value > 15 then
						--     return " " .. string.sub(variable.value, 1, 15) .. "... "
						--   end

						--   return " " .. variable.value
						-- end,
					})
				end,
			},
			"ofirgall/goto-breakpoints.nvim",
			{
				"LiadOz/nvim-dap-repl-highlights",
				build = ":TSInstall dap_repl",
				opts = {},
			},
			{
				"rcarriga/nvim-dap-ui",
				config = function()
					require("configs.dapui")
				end,
			},
		},
	},
	{
		"Weissle/persistent-breakpoints.nvim",
		ft = "go",
		config = function()
			require("persistent-breakpoints").setup({
				load_breakpoints_event = { "BufReadPost" },
			})
		end,
	},
}

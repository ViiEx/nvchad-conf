-- local autocmd = vim.api.nvim_create_autocmd
local create_cmd = vim.api.nvim_create_user_command

create_cmd("Http", function()
	require("kulala").run()
end, {})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.opt.conceallevel = 1

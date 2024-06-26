local status_ok, chat = pcall(require, "CopilotChat")

if not status_ok then
	return
end

local prompts = {
	-- Code related prompts
	Explain = "Please explain how the following code works.",
	Review = "Please review the following code and provide suggestions for improvement.",
	Tests = "Please explain how the selected code works, then generate unit tests for it.",
	Refactor = "Please refactor the following code to improve its clarity and readability.",
	FixCode = "Please fix the following code to make it work as intended.",
	FixError = "Please explain the error in the following text and provide a solution.",
	BetterNamings = "Please provide better names for the following variables and functions.",
	Documentation = "Please provide documentation for the following code.",
	SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
	SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
	-- Text related prompts
	Summarize = "Please summarize the following text.",
	Spelling = "Please correct any grammar and spelling errors in the following text.",
	Wording = "Please improve the grammar and wording of the following text.",
	Concise = "Please rewrite the following text to make it more concise.",
}

local select = require("CopilotChat.select")

local opts = {
	debug = true, -- Enable debug mode
	prompts = prompts,
	auto_follow_cursor = false, -- Don't follow the cursor after getting response
	mappings = {
		close = {
			normal = "q",
			insert = "<C-q>",
		}, -- Close chat
		reset = {
			normal = "<C-l>",
			insert = "<C-l>",
		}, -- Clear the chat buffer
		complete = {
			detail = "<C-c>",
			insert = "<C-c>",
		}, -- Change to insert mode and press tab to get the completion
		submit_prompt = {
			normal = "<CR>",
			insert = "<C-m>",
		}, -- Submit question to Copilot Chat
		accept_diff = {
			normal = "<C-a>",
			insert = "<C-a>",
		}, -- Accept the diff
		show_diff = {
			normal = "gd",
		}, -- Show the diff
	},
	selection = select.unnamed, -- Use the unnamed register for selection
}

-- Override the git prompts message
opts.prompts.Commit = {
	prompt = "Write commit message for the change with commitizen convention",
	selection = select.gitdiff,
}
opts.prompts.CommitStaged = {
	prompt = "Write commit message for the change with commitizen convention",
	selection = function(source)
		return select.gitdiff(source, true)
	end,
}

chat.setup(opts)

vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
	chat.ask(args.args, { selection = select.visual })
end, { nargs = "*", range = true })

-- Inline chat with Copilot
vim.api.nvim_create_user_command("CopilotChatInline", function(args)
	chat.ask(args.args, {
		selection = select.visual,
		window = {
			layout = "float",
			relative = "cursor",
			width = 1,
			height = 0.4,
			row = 1,
		},
	})
end, { nargs = "*", range = true })

vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
	chat.ask(args.args, { selection = select.buffer })
end, { nargs = "*", range = true })

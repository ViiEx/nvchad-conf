require("nvchad.mappings")

local map = vim.keymap.set

-- Normal Mode Mappings
map("n", ";", ":", { desc = "Enter command mode" })
map("n", "<leader>gg", "<cmd> LazyGit <cr>", { desc = "Git interface" })
map("n", "<C-h>", "<cmd> TmuxNavigateLeft <cr>", { desc = "Focus left pane" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight <cr>", { desc = "Focus right pane" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown <cr>", { desc = "Focus below pane" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp <cr>", { desc = "Focus above pane" })
map("n", "<leader>lf", "<cmd> Lspsaga diagnostic_jump_next <cr>", { desc = "Jump to next diagnostic" })
map("n", "<leader>cr", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { desc = "Inc Rename word under cursor" })
map("n", "<leader>cb", "<cmd> CBccbox <cr>", { desc = "Box Title", noremap = true, silent = true })
map("n", "<leader>ct", "<cmd> CBllline <cr>", { desc = "Titled Line", noremap = true, silent = true })
map("n", "<leader>cl", "<cmd> CBline <cr>", { desc = "Simple Line", noremap = true, silent = true })
map("n", "<leader>cm", "<cmd> CBllbox14 <cr>", { desc = "Marked", noremap = true, silent = true })
map("n", "<leader>cce", "<cmd> CopilotChatExplain <cr>", { desc = "🤖 CopilotChat - Explain code" })
map("n", "<leader>cct", "<cmd> CopilotChatTests <cr>", { desc = "🤖 CopilotChat - Generate tests" })
map("n", "<leader>ccT", "<cmd> CopilotChatVsplitToggle <cr>", { desc = "🤖 CopilotChat - Toggle Vsplit" })
map("n", "<leader>ccf", "<cmd> CopilotChatFixDiagnostic <cr>", { desc = "🤖 CopilotChat - Fix diagnostic" })
map(
	"n",
	"<leader>ccr",
	"<cmd> CopilotChatReset <cr>",
	{ desc = "🤖 CopilotChat - Reset chat history and clear buffer" }
)
map("n", "<leader>cci", function()
	local input = vim.fn.input("🤖 CopilotChat - Input: ")
	if input ~= "" then
		vim.cmd("CopilotChat " .. input)
	end
end, { desc = "🤖 CopilotChat - Input" })
map("n", "<leader>cch", function()
	local actions = require("CopilotChat.actions")
	require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end, { desc = "🤖 CopilotChat - Prompt actions" })
map("n", "<A-\\>", "<cmd> <cr>", { desc = "" })
map(
	"n",
	"<leader>xx",
	"<cmd> Telescope file_browser path=%:p:h select_buffer=true <cr>",
	{ desc = "📂 File Browser" }
)

-- Visual/Select Mode Mappings
map("v", ">", ">gv", { desc = "Indent" })
map("v", "<leader>cb", "<cmd> CBccbox <cr>", { desc = "Box Title", noremap = true, silent = true })
map("v", "<leader>ct", "<cmd> CBllline <cr>", { desc = "Titled Line", noremap = true, silent = true })
map("v", "<leader>cm", "<cmd> CBllbox14 <cr>", { desc = "Marked", noremap = true, silent = true })

-- Visual Mode Mappings
map("x", "<leader>ccv", "<cmd> CopilotChatVisual <cr>", { desc = "🤖 CopilotChat - Open in vertical split" })
map("x", "<leader>ccx", "<cmd> CopilotChatInPlace <cr>", { desc = "🤖 CopilotChat - Run in-place code" })

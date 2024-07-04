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
map("n", "<leader>lb", "<cmd> Lspsaga diagnostic_jump_prev <cr>", { desc = "Jump to previous diagnostic" })
map("n", "<leader>lR", "<cmd> Lspsaga rename <cr>", { desc = "Rename symbol" })
map("n", "<leader>lD", "<cmd> Lspsaga preview_definition <cr>", { desc = "Preview definition" })
map("n", "<leader>ld", "<cmd> Lspsaga hover_doc <cr>", { desc = "Hover doc" })
map("n", "<leader>lh", "<cmd> Lspsaga show_line_diagnostics <cr>", { desc = "Show line diagnostics" })
map("n", "<leader>cr", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { desc = "Inc Rename word under cursor" })
map("n", "<leader>cb", "<cmd> CBccbox <cr>", { desc = "Box Title", noremap = true, silent = true })
map("n", "<leader>ct", "<cmd> CBllline <cr>", { desc = "Titled Line", noremap = true, silent = true })
map("n", "<leader>cl", "<cmd> CBline <cr>", { desc = "Simple Line", noremap = true, silent = true })
map("n", "<leader>cm", "<cmd> CBllbox14 <cr>", { desc = "Marked", noremap = true, silent = true })
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

map({ "n", "i" }, "<M-Up>", "<Esc><cmd>m-2<CR>", { desc = "Move Line Up (Insert)", noremap = true, silent = true })
map({ "n", "i" }, "<M-Down>", "<Esc><cmd>m+<CR>", { desc = "Move Line Down (Insert)", noremap = true, silent = true })
map("x", "<M-Up>", ":move '<-2<CR>gv-gv", { desc = "Move Line Up (Visual)", noremap = true, silent = true })
map("x", "<M-Down>", ":move '>+1<CR>gv-gv", { desc = "Move Line Down (Visual)", noremap = true, silent = true })

map({ "n", "v" }, "<C-a>", "ggVG", { desc = "Select All", noremap = true, silent = true })

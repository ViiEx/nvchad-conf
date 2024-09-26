require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>gg", "<cmd> LazyGit <cr>", { desc = "Git interface" })
map({ "n", "i" }, "<M-Up>", "<Esc><cmd>m-2<CR>", { desc = "Move Line Up (Insert)", noremap = true, silent = true })
map({ "n", "i" }, "<M-Down>", "<Esc><cmd>m+<CR>", { desc = "Move Line Down (Insert)", noremap = true, silent = true })
map("x", "<M-Up>", ":move '<-2<CR>gv-gv", { desc = "Move Line Up (Visual)", noremap = true, silent = true })
map("x", "<M-Down>", ":move '>+1<CR>gv-gv", { desc = "Move Line Down (Visual)", noremap = true, silent = true })
map({ "n", "v" }, "<C-a>", "ggVG", { desc = "Select All", noremap = true, silent = true })

map("n", "<leader>lf", "<cmd> lspsaga diagnostic_jump_next <cr>", { desc = "jump to next diagnostic" })
map("n", "<leader>lb", "<cmd> lspsaga diagnostic_jump_prev <cr>", { desc = "jump to previous diagnostic" })
map("n", "<leader>lr", "<cmd> lspsaga rename <cr>", { desc = "rename symbol" })
map("n", "<leader>ld", "<cmd> lspsaga preview_definition <cr>", { desc = "preview definition" })
map("n", "<leader>ld", "<cmd> lspsaga hover_doc <cr>", { desc = "hover doc" })
map("n", "<leader>lh", "<cmd> lspsaga show_line_diagnostics <cr>", { desc = "show line diagnostics" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

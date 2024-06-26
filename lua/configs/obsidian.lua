local status_ok, obsidian = pcall(require, "obsidian")

if not status_ok then
	return
end

--- Check if a file or directory exists in this path
local function exists(file)
	local ok, err, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	return ok, err
end

--- Check if a directory exists in this path
local function isdir(path)
	-- "/" works on both Unix and Windows
	return exists(path .. "/")
end

local handleVault = function()
	if not isdir(vim.fn.expand("~/Documents/Vaults")) then
		vim.notify("Vaults directory does not exist. Creating it now.")
		os.execute("mkdir " .. vim.fn.expand("~/Documents/Vaults"))
	end
end

local workspacesHandler = function()
	local workspaces = {}

	local i, vaults, popen = 0, {}, io.popen
	local pfile = popen("ls ~/Documents/Vaults")
	-- check if pfile is nil
	if not pfile then
		handleVault()
		pfile = popen("ls ~/Documents/Vaults")
	end
	for filename in pfile:lines() do
		i = i + 1
		vaults[i] = filename
	end
	pfile:close()
	for _, vault in ipairs(vaults) do
		table.insert(workspaces, {
			name = vault,
			path = "~/Documents/Vaults/" .. vault,
		})
	end

	-- If there is no vault, create a default one
	if #workspaces == 0 then
		vim.notify("No vaults found. Creating a default one.")
		os.execute("mkdir " .. vim.fn.expand("~/Documents/Vaults/Default"))
		table.insert(workspaces, {
			name = "Default",
			path = vim.fn.expand("~/Documents/Vaults/Default"),
		})
	end

	return workspaces
end

local opts = {
	workspaces = workspacesHandler(),

	mappings = {
		-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
		["<CR>"] = {
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
			opts = { noremap = false, expr = true, buffer = true },
		},
		-- Toggle check-boxes.
		["<leader>mc"] = {
			action = function()
				return require("obsidian").util.toggle_checkbox()
			end,
			opts = { buffer = true },
		},
	},

	templates = {
		subdir = "Templates",
		date_format = "%d/%m/%Y",
		time_format = "%H:%M",
		-- A map for custom variables, the key should be the variable and the value a function
		substitutions = {},
	},

	ui = {
		enable = true, -- set to false to disable all additional syntax features
		update_debounce = 200, -- update delay after a text change (in milliseconds)
		-- Define how various check-boxes are displayed
		checkboxes = {
			-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
			[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
			["x"] = { char = "", hl_group = "ObsidianDone" },
			[">"] = { char = "", hl_group = "ObsidianRightArrow" },
			["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
			-- Replace the above with this if you don't have a patched font:
			-- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
			-- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

			-- You can also add more custom ones...
		},
		-- Use bullet marks for non-checkbox lists.
		bullets = { char = "•", hl_group = "ObsidianBullet" },
		external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
		-- Replace the above with this if you don't have a patched font:
		-- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
		reference_text = { hl_group = "ObsidianRefText" },
		highlight_text = { hl_group = "ObsidianHighlightText" },
		tags = { hl_group = "ObsidianTag" },
		hl_groups = {
			-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
			ObsidianTodo = { bold = true, fg = "#f78c6c" },
			ObsidianDone = { bold = true, fg = "#89ddff" },
			ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
			ObsidianTilde = { bold = true, fg = "#ff5370" },
			ObsidianBullet = { bold = true, fg = "#89ddff" },
			ObsidianRefText = { underline = true, fg = "#c792ea" },
			ObsidianExtLinkIcon = { fg = "#c792ea" },
			ObsidianTag = { italic = true, fg = "#89ddff" },
			ObsidianHighlightText = { bg = "#75662e" },
		},
	},
}

obsidian.setup(opts)

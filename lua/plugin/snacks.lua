return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		dashboard = {
			sections = {
				{ section = "header" },
				{ section = "keys", padding = {1, 2} },
				{ section = "recent_files", icon = " ", title = "Recent Files", cwd = true, padding = 1 },
    		{ section = "startup" },
			},
		},
		picker = {
			win = {
				input = {
					keys = {
						["<Esc>"] = { "close", mode = { "n", "i" } },
					}
				}
			}
		},
		git = {},
		input = {},
		notifier = {},
		quickfile = {},
		statuscolumn = {
			enabled = true
		},
		terminal = {
			win = {
				style = "float",
				border = true,
				title = " Terminal ",
				height = .6,
			}
		}
	},
	keys = {
		-- Search files
		{ "<C-p>", function() Snacks.picker.files() end, desc = "Files" },
		{ "<leader>sf", function() Snacks.picker.files() end, desc = "Files" },
		{ "<leader>sF", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
		{ "<leader>sn", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Search Nvim Config" },
		{ "<leader>sr", function() Snacks.picker.recent() end, desc = "Resume" },
		{ "<leader>sb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		-- Search in file
		{ "<leader>sa", vim.lsp.buf.code_action, desc = "Code Actions" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
		{ "<leader>sG", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
		{ "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
		{ "<leader>sl", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
		{ "<leader>sp", function() Snacks.picker.projects() end, desc = "Projects" },
		-- Search utils
		{ "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
		{ "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
		{ "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
		{ "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
		{ "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
		{ "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
		{ "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
		{ "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
		{ "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
		{ "<leader>st", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    -- git
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
		{ "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    -- LSP 
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gt", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto Type Definitions" },
		{ "<leader>ss", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
		{ "<leader>sS", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
		{ "<leader>rn", function() vim.lsp.buf.rename() end, desc = "Rename" },
		{ "K", function() vim.lsp.buf.hover() end, desc = "Hover Documentation" },
		-- Terminal
		{ "<C-t>", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal", mode = {"n", "t"} }
  },
}

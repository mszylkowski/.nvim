return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal toggle=true left<CR>", { silent = true })
		vim.g.loaded_netrwPlugin = 0
		vim.g.loaded_netrw = 0
		require("neo-tree").setup({
			default_component_configs = {
				modified = {
					symbol = " ",
				},
			},
			event_handlers = {
				{
					event = "file_opened",
					handler = function(file_path)
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
			window = {
				width = 30,
				auto_expand_width = true,
			},
			enable_diagnostics = false,
			close_if_last_window = true,
			use_popups_for_input = false,
		})
	end,
}

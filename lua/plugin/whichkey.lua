return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>w", group = "[W]orkspace" },
		},
	},
}

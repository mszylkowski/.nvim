return {
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		event = "BufEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
}

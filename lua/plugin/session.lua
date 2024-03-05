return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			auto_save_enabled = true,
		})

		vim.keymap.set(
			"n",
			"<leader>ss",
			require("auto-session.session-lens").search_session,
			{ desc = "[S]earch [S]ession" }
		)
	end,
}

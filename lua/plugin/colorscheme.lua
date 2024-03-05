return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	priority = 1000,
	lazy = false,
	config = function()
		vim.cmd("colorscheme github_dark_high_contrast")
	end,
}

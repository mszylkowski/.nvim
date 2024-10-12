return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				integrations = {
					mason = true,
					which_key = true,
					neotree = true,
				},
				highlight_overrides = {
					--@param color palette
					mocha = function(color)
						return {
							NeoTreeNormal = { bg = color.mantle },
						}
					end,
				},
			})
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
	-- Use ":Telescope colorscheme" to try these out.
	-- {
	-- 	"projekt0n/github-nvim-theme",
	-- 	event = "VeryLazy",
	-- 	name = "github-theme",
	-- },
	--
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	event = "VeryLazy",
	-- },
}

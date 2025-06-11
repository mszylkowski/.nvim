return {
	{
		"folke/neodev.nvim",
		opts = {},
		ft = { "lua" },
		event = "BufEnter",
	},
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				border = "rounded",
				icons = {
					package_installed = "",
					package_uninstalled = "",
					package_pending = "󰿣",
				},
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "svelte", "ts_ls" },
		},
	},
	{ "j-hui/fidget.nvim", opts = {} },
	{
		"neovim/nvim-lspconfig",
		event = "BufEnter",
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					map("<leader>gt", require("telescope.builtin").lsp_type_definitions, "[T]ype Definition")
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				end,
			})

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.svelte.setup({})
			lspconfig.basedpyright.setup({
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "standard",
						},
					},
				},
			})
			lspconfig.ruff.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.tailwindcss.setup({})
		end,
	},
	{
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {},
		ft = { "typescriptreact", "javascriptreact", "svelte", "html", "css" },
	},
}

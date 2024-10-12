return {
	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup({})
		end,
		ft = { "lua" },
		event = "BufEnter",
	},
	{
		"neovim/nvim-lspconfig",
		event = "BufEnter",
		dependencies = {
			{
				"williamboman/mason.nvim",
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
				"williamboman/mason-lspconfig.nvim",
				config = function()
					require("mason-lspconfig").setup({
						ensure_installed = { "lua_ls", "svelte" },
					})
				end,
			},
			{ "j-hui/fidget.nvim", opts = {} },
		},
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
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
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
			lspconfig.ruff_lsp.setup({})
		end,
	},
}

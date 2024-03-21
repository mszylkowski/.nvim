return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver", "svelte" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		event = "VeryLazy",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.tsserver.setup({})
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

			local map = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { desc = "LSP: " .. desc })
			end
			-- Jump to the definition of the word under your cursor.
			--  This is where a variable was first declared, or where a function is defined, etc.
			--  To jump back, press <C-T>.
			map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

			-- Find references for the word under your cursor.
			map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

			-- Jump to the implementation of the word under your cursor.
			--  Useful when your language has ways of declaring types without an actual implementation.
			map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

			-- Jump to the type of the word under your cursor.
			--  Useful when you're not sure what type a variable is and you want to see
			--  the definition of its *type*, not where it was *defined*.
			map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

			-- Fuzzy find all the symbols in your current document.
			--  Symbols are things like variables, functions, types, etc.
			map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

			-- Fuzzy find all the symbols in your current workspace
			--  Similar to document symbols, except searches over your whole project.
			map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

			-- Rename the variable under your cursor
			--  Most Language Servers support renaming across files, etc.
			map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

			-- Execute a code action, usually your cursor needs to be on top of an error
			-- or a suggestion from your LSP for this to activate.
			map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

			-- Opens a popup that displays documentation about the word under your cursor
			--  See `:help K` for why this keymap
			map("K", vim.lsp.buf.hover, "Hover Documentation")

			-- WARN: This is not Goto Definition, this is Goto Declaration.
			--  For example, in C this would take you to the header
			map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		end,
	},
	{ "folke/neodev.nvim", opts = {}, fs = { "lua" } },
}

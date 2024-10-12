return {
	"akinsho/toggleterm.nvim",
	config = function()
		-- This is necessary for powershell integration.
		local powershell_options = {
			shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
			shellcmdflag =
			"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
			shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
			shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
			shellquote = "",
			shellxquote = "",
		}
		for option, value in pairs(powershell_options) do
			vim.opt[option] = value
		end

		require("toggleterm").setup({
			direction = "float",
			float_opts = {
				border = "curved",
			},
			open_mapping = [[<C-t>]],
		})

		-- vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.opt_local.number = false
			vim.opt_local.relativenumber = false
			vim.opt_local.signcolumn = "no"
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}

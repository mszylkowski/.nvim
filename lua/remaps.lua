-- All remaps that should happen in all contexts.
-- For specific context mappings, use the plugin setups.

-- In visual line mode (Shift+V), Shift+J and Shift+K move the lines up/down.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })

-- Override Ctrl+D and Ctrl+U to center line after moving.
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page" })

-- When searching, bring line to the middle.
vim.keymap.set("n", "n", "nzzzv", { desc = "Next match" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous match" })

-- leader+P pastes over a selection without yanking the selection.
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Pastes without yanking" })

-- leader+D deletes without yanking.
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

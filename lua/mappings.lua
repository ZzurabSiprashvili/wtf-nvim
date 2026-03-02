local map = vim.keymap.set

-- General
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Window navigation
map("n", "<S-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<S-j>", "<C-w>j", { desc = "Move to below split" })
map("n", "<S-k>", "<C-w>k", { desc = "Move to above split" })
map("n", "<S-l>", "<C-w>l", { desc = "Move to right split" })
map("n", "<leader>|", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>-", "<cmd>split<CR>", { desc = "Horizontal split" })

-- Comments
map("n", "<leader>/", "gcc", { remap = true, desc = "Toggle comment" })
map("v", "<leader>/", "gc", { remap = true, desc = "Toggle comment" })

-- Diagnostics
map("n", "<leader>xr", vim.diagnostic.reset, { desc = "Reset diagnostics" })

-- Buffers
map("n", "<leader>w", "<cmd>bd<CR>", { desc = "Close Buffer" })

-- Terminal
map("t", "<C-x>", "<C-\\><C-n><C-w>w", { desc = "Exit terminal focus" })

-- Plugin-specific mappings
require("plugins.mappings")

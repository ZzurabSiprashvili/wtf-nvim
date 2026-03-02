local map = vim.keymap.set

map("n", "<leader>e", "<cmd>Yazi<cr>", { desc = "Yazi (file)" })
map("n", "<leader>E", "<cmd>Yazi cwd<cr>", { desc = "Yazi (cwd)" })

local map = vim.keymap.set

map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffview" })
map("n", "<leader>gH", "<cmd>DiffviewFileHistory<cr>", { desc = "File History" })
map("n", "<leader>gf", "<cmd>DiffviewFocusFiles<cr>", { desc = "Focus Files" })
map("n", "<leader>gt", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle Files" })
map("n", "<leader>gc", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", { desc = "Current File History" })
map("n", "<leader>gs", "<cmd>DiffviewOpen --staged<cr>", { desc = "Staged Changes" })
map("n", "<leader>gm", "<cmd>DiffviewOpen main<cr>", { desc = "Compare with main" })
map("n", "<leader>gM", "<cmd>DiffviewOpen master<cr>", { desc = "Compare with master" })

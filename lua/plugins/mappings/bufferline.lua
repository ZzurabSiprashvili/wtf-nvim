local map = vim.keymap.set

map("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle Pin" })
map("n", "<leader>bxr", "<Cmd>BufferLineCloseRight<CR>", { desc = "Close Right" })
map("n", "<leader>bxl", "<Cmd>BufferLineCloseLeft<CR>", { desc = "Close Left" })
map("n", "<leader>W", "<Cmd>BufferLinePickClose<CR>", { desc = "Pick Close" })
map("n", "<leader>bb", "<Cmd>BufferLinePick<CR>", { desc = "Pick Buffer" })
map("n", "<C-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
map("n", "<C-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<C-S-H>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Prev" })
map("n", "<C-S-L>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Next" })

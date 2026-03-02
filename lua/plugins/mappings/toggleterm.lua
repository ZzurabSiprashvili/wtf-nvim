local map = vim.keymap.set

map("n", "<leader>H", function() require("plugins.configs.toggleterm").toggle("bottom") end, { desc = "Terminal bottom" })
map("n", "<leader>L", function() require("plugins.configs.toggleterm").toggle("right") end, { desc = "Terminal right" })
map("n", "<leader>hP", function() require("plugins.configs.toggleterm").toggle("python_h") end, { desc = "Python bottom" })
map("n", "<leader>lP", function() require("plugins.configs.toggleterm").toggle("python_v") end, { desc = "Python right" })
map("n", "<leader>hN", function() require("plugins.configs.toggleterm").toggle("node_h") end, { desc = "Node bottom" })
map("n", "<leader>lN", function() require("plugins.configs.toggleterm").toggle("node_v") end, { desc = "Node right" })
map("n", "<leader>hC", function() require("plugins.configs.toggleterm").toggle("claude") end, { desc = "Claude (float)" })
map("n", "<leader>hG", function() require("plugins.configs.toggleterm").toggle("gemini") end, { desc = "Gemini (float)" })

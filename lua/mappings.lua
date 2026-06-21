local map = vim.keymap.set

-- General
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<S-Tab>", function()
	vim.notify(vim.fn.expand("%:."))
end, { desc = "Show current file path" })

-- Window navigation
map("n", "<S-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<S-j>", "<C-w>j", { desc = "Move to below split" })
-- map("n", "<S-k>", "<C-w>k", { desc = "Move to above split" })
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

-- Yazi
map("n", "<leader>e", "<cmd>Yazi<cr>", { desc = "Yazi (file)" })
map("n", "<leader>E", "<cmd>Yazi cwd<cr>", { desc = "Yazi (cwd)" })

-- Trouble
map("n", "<leader>xd", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics" })
map("n", "<leader>xD", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer diagnostics" })

-- TogggleTerm
map("n", "<leader>H", function()
	require("configs.toggleterm").toggle("bottom")
end, { desc = "Terminal bottom" })
map("n", "<leader>L", function()
	require("configs.toggleterm").toggle("right")
end, { desc = "Terminal right" })
map("n", "<leader>hP", function()
	require("configs.toggleterm").toggle("python_h")
end, { desc = "Python bottom" })
map("n", "<leader>lP", function()
	require("configs.toggleterm").toggle("python_v")
end, { desc = "Python right" })
map("n", "<leader>hN", function()
	require("configs.toggleterm").toggle("node_h")
end, { desc = "Node bottom" })
map("n", "<leader>lN", function()
	require("configs.toggleterm").toggle("node_v")
end, { desc = "Node right" })
map("n", "<leader>hC", function()
	require("configs.toggleterm").toggle("claude")
end, { desc = "Claude (float)" })
map("n", "<leader>hG", function()
	require("configs.toggleterm").toggle("gemini")
end, { desc = "Gemini (float)" })

-- TODO Comments
map("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next Todo" })
map("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Prev Todo" })
map("n", "<leader>xt", "<cmd>Trouble todo toggle<cr>", { desc = "Todo (Trouble)" })
map("n", "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", { desc = "Todo/Fix/Fixme" })
map("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Todo" })
map("n", "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", { desc = "Todo/Fix/Fixme" })

-- Telescope
map("n", "<leader>,", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", { desc = "Switch Buffer" })
map("n", "<leader>?", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
map("n", "<leader><space>", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>fr", function()
	local cwd = vim.fn.getcwd() .. "/"
	local oldfiles = vim.tbl_filter(function(f)
		return vim.startswith(f, cwd)
	end, vim.v.oldfiles)
	require("telescope.builtin").oldfiles({ results = oldfiles })
end, { desc = "Recent Files (cwd)" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
map("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Grep Word" })
map("n", "<leader>fm", "<cmd>Telescope marks<cr>", { desc = "Marks" })
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
map("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Git Files" })
map("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Git Status" })
map("n", "<leader>fb", "<cmd>Telescope git_branches<cr>", { desc = "Git Branches" })
map("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", { desc = "Git Commits" })
map("n", "<leader>fB", "<cmd>Telescope git_bcommits<cr>", { desc = "Buffer Commits" })
map("n", "<leader>fS", "<cmd>Telescope git_stash<cr>", { desc = "Git Stash" })

-- Outline
map("n", "<leader>co", "<cmd>Outline<cr>", { desc = "Toggle Outline" })

-- NeoTree
map("n", "<Tab><Tab>", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neotree" })

-- LazyGit
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

-- Flash
map({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })
map({ "n", "o", "x" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })
map("o", "r", function()
	require("flash").remote()
end, { desc = "Remote Flash" })
map({ "o", "x" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter Search" })
map("c", "<c-s>", function()
	require("flash").toggle()
end, { desc = "Toggle Flash Search" })

-- DiffView
map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffview" })
map("n", "<leader>gH", "<cmd>DiffviewFileHistory<cr>", { desc = "File History" })
map("n", "<leader>gf", "<cmd>DiffviewFocusFiles<cr>", { desc = "Focus Files" })
map("n", "<leader>gt", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle Files" })
map("n", "<leader>gc", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" })
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", { desc = "Current File History" })
map("n", "<leader>gs", "<cmd>DiffviewOpen --staged<cr>", { desc = "Staged Changes" })
map("n", "<leader>gm", "<cmd>DiffviewOpen main<cr>", { desc = "Compare with main" })
map("n", "<leader>gM", "<cmd>DiffviewOpen master<cr>", { desc = "Compare with master" })

-- Conform
map("n", "++", function()
	require("conform").format({ timeout_ms = 4000 })
end, { desc = "Format" })
map("v", "++", function()
	require("conform").format({ range = true, timeout_ms = 4000 })
end, { desc = "Format" })

-- Bufferline
map("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle Pin" })
map("n", "<leader>bxr", "<Cmd>BufferLineCloseRight<CR>", { desc = "Close Right" })
map("n", "<leader>bxl", "<Cmd>BufferLineCloseLeft<CR>", { desc = "Close Left" })
map("n", "<leader>W", "<Cmd>BufferLinePickClose<CR>", { desc = "Pick Close" })
map("n", "<leader>bb", "<Cmd>BufferLinePick<CR>", { desc = "Pick Buffer" })
map("n", "<C-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
map("n", "<C-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<C-S-H>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Prev" })
map("n", "<C-S-L>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Next" })
map("n", "<C-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go to buffer 1" })
map("n", "<C-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go to buffer 2" })
map("n", "<C-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go to buffer 3" })
map("n", "<C-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", { desc = "Go to buffer 4" })
map("n", "<C-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", { desc = "Go to buffer 5" })
map("n", "<C-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", { desc = "Go to buffer 6" })
map("n", "<C-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", { desc = "Go to buffer 7" })


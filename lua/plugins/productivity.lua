return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		opts = require("configs.telescope"),
	},
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v3.x",
	-- 	cmd = "Neotree",
	-- 	opts = require("configs.neotree"),
	-- },
	{
		"mikavilpas/yazi.nvim",
		cmd = "Yazi",
		opts = require("configs.yazi"),
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		vscode = true,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = require("configs.gitsigns"),
	},

	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
		config = function()
			require("configs.diffview")
		end,
	},
	{ "folke/trouble.nvim", cmd = "Trouble", opts = {} },
	-- { "hedyhli/outline.nvim", cmd = "Outline", opts = {} },

	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = "VeryLazy",
		opts = require("configs.todo-comments"),
	},

	-- { "folke/which-key.nvim", event = "VeryLazy" },

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = function()
			return require("configs.conform")
		end,
	},

	{
		"saghen/blink.cmp",
		version = "1.*",
		event = "InsertEnter",
		opts = function()
			return require("configs.blink")
		end,
	},

	{ "chentoast/marks.nvim", event = "VeryLazy", opts = {} },

	-- {
	-- 	"rcarriga/nvim-notify",
	-- 	lazy = false,
	-- 	config = function()
	-- 		local notify = require("notify")
	-- 		notify.setup({})
	-- 		vim.notify = notify
	-- 	end,
	-- },
	--
	{ "akinsho/toggleterm.nvim", lazy = true },
}


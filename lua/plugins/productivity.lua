return {
	{
		"nvim-telescope/telescope.nvim",
		commit = "9377230aa5305d9e9aca4ed8dadf1070fb4aa9fc",
		cmd = "Telescope",
		opts = require("configs.telescope"),
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
		opts = require("configs.neotree"),
	},
	{
		"mikavilpas/yazi.nvim",
		commit = "7514be498c56f2a57e5a72faf55c517b9576665b",
		cmd = "Yazi",
		opts = require("configs.yazi"),
	},
	{
		"folke/flash.nvim",
		commit = "fcea7ff883235d9024dc41e638f164a450c14ca2",
		event = "VeryLazy",
		vscode = true,
	},
	{
		"kdheepak/lazygit.nvim",
		commit = "a04ad0dbc725134edbee3a5eea29290976695357",
		cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
	},
	{
		"lewis6991/gitsigns.nvim",
		commit = "25050e4ed39e628282831d4cbecb1850454ce915",
		event = { "BufReadPre", "BufNewFile" },
		opts = require("configs.gitsigns"),
	},

	{
		"sindrets/diffview.nvim",
		commit = "4516612fe98ff56ae0415a259ff6361a89419b0a",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
		config = function()
			require("configs.diffview")
		end,
	},
	{ "folke/trouble.nvim", commit = "bd67efe408d4816e25e8491cc5ad4088e708a69a", cmd = "Trouble", opts = {} },
	{ "hedyhli/outline.nvim", cmd = "Outline", opts = {} },

	{
		"folke/todo-comments.nvim",
		commit = "31e3c38ce9b29781e4422fc0322eb0a21f4e8668",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = "VeryLazy",
		opts = require("configs.todo-comments"),
	},

	{ "folke/which-key.nvim", event = "VeryLazy" },

	{
		"stevearc/conform.nvim",
		commit = "619363c30309d29ffa631e67c8183f2a72caa373",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = function()
			return require("configs.conform")
		end,
	},

	{
		"saghen/blink.cmp",
		commit = "78336bc89ee5365633bcf754d93df01678b5c08f",
		event = "InsertEnter",
		opts = function()
			return require("configs.blink")
		end,
	},

	{ "chentoast/marks.nvim", commit = "f353e8c08c50f39e99a9ed474172df7eddd89b72", event = "VeryLazy", opts = {} },

	{
		"rcarriga/nvim-notify",
		lazy = false,
		config = function()
			local notify = require("notify")
			notify.setup({})
			vim.notify = notify
		end,
	},

	{ "akinsho/toggleterm.nvim", commit = "9a88eae817ef395952e08650b3283726786fb5fb", lazy = true },
}

return {
	-- { "karb94/neoscroll.nvim", enabled = false, event = "VeryLazy" },

	{ "sphamba/smear-cursor.nvim", event = "VeryLazy", opts = {} },

	{
		"goolord/alpha-nvim",
		lazy = false,
		config = function()
			require("configs.alpha")
		end,
	},

	{
		"nvimdev/indentmini.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("configs.indentmini")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {},
	},

	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		opts = {},
	},

	{ "ZzurabSiprashvili/monokai-night.nvim", lazy = false, priority = 1000 },

	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		version = false,
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("configs.treesitter")
		end,
	},
}


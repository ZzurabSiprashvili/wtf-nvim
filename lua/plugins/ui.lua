return {
	{ "karb94/neoscroll.nvim", enabled = false, event = "VeryLazy" },

	{ "sphamba/smear-cursor.nvim", event = "VeryLazy", opts = {} },

	{
		"goolord/alpha-nvim",
		commit = "6c6a89d5b068b5251c8bdf0dd57bb921bcfeeb09",
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
		commit = "221ce6b2d999187044529f49da6554a92f740a96",
		event = "VeryLazy",
		opts = {},
	},

	{
		"akinsho/bufferline.nvim",
		commit = "655133c3b4c3e5e05ec549b9f8cc2894ac6f51b3",
		event = "VeryLazy",
		opts = {},
	},

	{
		"ZzurabSiprashvili/monokai-night.nvim",
		commit = "008a48c5d1ff0258ec7246d3f243b6308248b7db",
		lazy = false,
		priority = 1000,
	},

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

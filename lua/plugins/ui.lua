return {
	{ "karb94/neoscroll.nvim", enabled = false, event = "VeryLazy" },

	{
		"sphamba/smear-cursor.nvim",
		commit = "9e9378d6ee34bb3782e0e8c63d9ec8ca618b479b",
		enabled = false,
		event = "VeryLazy",
		opts = {
			smear_between_adjacent_lines = false,
			smear_between_buffers = false,
			min_speed = 20,
			max_speed = 60,
			easing = "ease-in-out",
		},
	},

	{
		"goolord/alpha-nvim",
		commit = "6c6a89d5b068b5251c8bdf0dd57bb921bcfeeb09",
    enabled = true,
		lazy = false,
		config = function()
			require("configs.alpha")
		end,
	},

	{
		"nvimdev/indentmini.nvim",
		commit = "38572ce5a7a064a5deb89d6d861b7c40fc929ab1",
		event = { "BufReadPre", "BufNewFile" },
    enabled = true,
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
		commit = "5cb0114e6242625db56dd6440e945ed1ece10bc7",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("configs.treesitter")
		end,
	},
}

return {
	{
		"mason-org/mason-lspconfig.nvim",
		commit = "21c5b3ebeaa0412e28096bb0701434c51c1fbf76",
		lazy = false,
		opts = function()
			return require("configs.mason")
		end,
		dependencies = {
			{ "mason-org/mason.nvim", commit = "2a6940af80375532e5e9e7c1f2fc6319a1b7a69d", opts = {} },
			{ "neovim/nvim-lspconfig", commit = "a683e0ddf0cf64c6cd689e18ffb480ade3c162b7" },
		},
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		commit = "443f1ef8b5e6bf47045cb2217b6f748a223cf7dc",
		enabled = true,
		lazy = false,
		opts = function()
			return require("configs.mason-tools")
		end,
		dependencies = { "mason-org/mason.nvim" },
	},
}

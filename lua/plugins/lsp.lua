return {
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false,
		opts = function()
			return require("configs.mason")
		end,
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		enabled = true,
		lazy = false,
		opts = function()
			return require("configs.mason-tools")
		end,
		dependencies = { "mason-org/mason.nvim" },
	},
}

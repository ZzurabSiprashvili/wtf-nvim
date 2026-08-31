return {
	{
		"mfussenegger/nvim-dap",
		commit = "9e848e09a697ee95302a3ef2dd43fd6eb709e570",
		lazy = false,
		enabled = true,
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				commit = "cc9dd33aade7f20bae414d0cba163bc60d4d4b43",
				dependencies = { { "nvim-neotest/nvim-nio", lazy = true } },
				config = function()
					require("configs.dap")
				end,
			},
		},
	},
}


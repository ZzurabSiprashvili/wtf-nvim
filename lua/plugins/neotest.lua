return {
	{
		"nvim-neotest/neotest",
		commit = "1c529a1ef9c82e8131e872368415cecc2bb86ea2",
		dependencies = {
			{ "nvim-neotest/nvim-nio", commit = "edcc181a875301dd21840189aa2f2f9ad69fc172", lazy = true },
			{ "rouge8/neotest-rust", commit = "2c9941d4a358839918fac21d20fc8fef0e1ad05f" },
		},
		config = function()
			require("configs.neotest")
		end,
	},
}

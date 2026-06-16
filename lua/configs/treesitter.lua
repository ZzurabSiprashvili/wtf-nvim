local treesitter = require("nvim-treesitter")

treesitter.setup({
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc",
		"javascript",
		"typescript",
		"tsx",
		"html",
		"css",
		"json",
		"yaml",
		"rust",
		"python",
		"go",
	},
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})

vim.treesitter.language.register("tsx", "typescriptreact")

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescriptreact", "typescript", "tsx" },
	callback = function(args)
		vim.treesitter.start(args.buf)
	end,
})


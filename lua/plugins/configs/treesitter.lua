local treesitter = require("nvim-treesitter")

treesitter.setup({
	ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "tsx", "html", "css", "json", "yaml" },
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})

vim.treesitter.language.register("tsx", "typescriptreact")

-- Force treesitter to attach on tsx/ts files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescriptreact", "typescript", "tsx" },
	callback = function(args)
		vim.treesitter.start(args.buf)
	end,
})
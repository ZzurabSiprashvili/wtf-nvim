return vim.list_extend(
	vim.list_extend(require("plugins.essentials"), require("plugins.productivity")),
	vim.list_extend(
		vim.list_extend(vim.list_extend(require("plugins.unnecessary"), require("plugins.ui")), require("plugins.ai")),
		vim.list_extend(require("plugins.lsp"), require("plugins.neotest"))
	)
)

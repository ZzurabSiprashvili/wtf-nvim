return {
	formatters_by_ft = {
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		json = { "prettier" },
		jsonc = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		markdown = { "prettier" },
		yaml = { "prettier" },
		lua = { "stylua" },
		python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
		go = { "gofumpt" },
		rust = { "rustfmt" },
	},
	-- format_on_save = {
	--   timeout_ms = 500,
	--   lsp_fallback = true,
	-- },
}

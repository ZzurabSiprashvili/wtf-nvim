-- Inlay hints: per-server settings plus the toggle command.

local M = {}

-- Per-server inlay hint settings. Anything not listed here uses the
-- server's own defaults.
M.servers = {
	rust_analyzer = {
		["rust-analyzer"] = {
			inlayHints = {
				typeHints = { enable = true },
				parameterHints = { enable = true },
				chainingHints = { enable = true },
				closingBraceHints = { enable = true, minLines = 25 },
			},
		},
	},
}

--- Toggle inlay hints for the current buffer.
function M.toggle(bufnr)
	bufnr = (bufnr == nil or bufnr == 0) and vim.api.nvim_get_current_buf() or bufnr
	local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
	vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
end

--- Whether inlay hints are currently shown in the current buffer.
function M.enabled(bufnr)
	return vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr or 0 })
end

for server, settings in pairs(M.servers) do
	vim.lsp.config(server, { settings = settings })
end

vim.api.nvim_create_user_command("InlayHintsToggle", function()
	M.toggle(0)
end, { desc = "Toggle inlay hints in the current buffer" })

return M

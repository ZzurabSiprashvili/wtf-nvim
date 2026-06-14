local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.opt.updatetime = 300

local seen_msg
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
		format = function(d)
			local msg = d.message:gsub("%s+", " "):gsub("^%s*(.-)%s*$", "%1")
			-- Strip source prefix for dedup (e.g. "ts: msg" and "typescript: msg" -> same)
			local core = msg:gsub("^[%w_-]+:%s*", "")
			if seen_msg == core then
				return nil
			end
			seen_msg = core
			return d.message
		end,
	},
})


local orig_open_float = vim.diagnostic.open_float
function vim.diagnostic.open_float(opts, ...)
	seen_msg = nil
	return orig_open_float(opts, ...)
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)

		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})


return {
	ensure_installed = {
		"tsgo",
		"lua_ls",
		"basedpyright",
		"gopls",
		"jsonls",
		"cssls",
		"html",
		"eslint",
		"rust_analyzer",
	},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
	},
}

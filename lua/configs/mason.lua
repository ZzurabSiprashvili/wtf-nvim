local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.opt.updatetime = 300

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
			return d.message
		end,
	},
})

local function on_attach(client, _)
	client.server_capabilities.semanticTokensProvider = nil
end

-- Show diagnostic float on cursor hold (hover) when line has diagnostics
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		local line = vim.api.nvim_win_get_cursor(0)[1] - 1
		local diags = vim.diagnostic.get(bufnr, { lnum = line })
		if #diags > 0 then
			vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
		end
	end,
})

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
			if client:supports_method("textDocument/inlayHint") then
				vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
			end
		end
	end,
})

vim.api.nvim_create_user_command("InlayHintsToggle", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
end, {})

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
		"yamlls",
		"helm_ls",
	},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
		rust_analyzer = function()
			require("lspconfig").rust_analyzer.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					["rust-analyzer"] = {
						inlayHints = {
							typeHints = { enable = true },
							parameterHints = { enable = true },
							chainingHints = { enable = true },
							closingBraceHints = { enable = true, minLines = 25 },
						},
					},
				},
			})
		end,
		yamlls = function()
			require("lspconfig").yamlls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					redhat = { telemetry = { enabled = false } },
					yaml = {
						format = { enable = true },
						schemaStore = {
							enable = true,
							url = "https://www.schemastore.org/api/json/catalog.json",
						},
						schemas = {
							["https://json.schemastore.org/kustomization.json"] = "/kustomization.yaml",
							["https://json.schemastore.org/docker-compose.json"] = "docker-compose*.{yaml,yml}",
							["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
							kubernetes = "**",
						},
					},
				},
			})
		end,
	},
}

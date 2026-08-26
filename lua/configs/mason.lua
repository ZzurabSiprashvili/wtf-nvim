local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("*", { capabilities = capabilities })

vim.opt.updatetime = 300

vim.diagnostic.config({
	virtual_text = {
		prefix = function(diag)
			local sev = diag.severity
			if sev == vim.diagnostic.severity.ERROR then
				return "❌ "
			elseif sev == vim.diagnostic.severity.WARN then
				return "⚠️ "
			end
			return "· "
		end,
		spacing = 1,
		format = function(d)
			-- Trim trailing newline but keep the full multiline message inline
			return vim.trim(d.message)
		end,
	},
	virtual_lines = false,
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

vim.lsp.config("rust_analyzer", {
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

vim.lsp.config("yamlls", {
	settings = {
		redhat = { telemetry = { enabled = false } },
		yaml = {
			format = { enable = true },
			schemaStore = {
				enable = true,
				url = "https://www.schemastore.org/api/json/catalog.json",
			},
			schemas = {
				["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.30.0-standalone-strict/all.json"] = "*.yaml",
			},
		},
	},
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
		"yamlls",
		"helm_ls",
	},
}

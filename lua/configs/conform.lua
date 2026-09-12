local function project_has(files)
	return vim.fs.find(files, { upward = true })[1] ~= nil
end

local function uses_biome()
	return project_has({ "biome.json", "biome.jsonc" })
end

local function uses_prettier()
	return project_has({
		".prettierrc",
		".prettierrc.json",
		".prettierrc.yaml",
		".prettierrc.yml",
		".prettierrc.js",
		".prettierrc.cjs",
		".prettierrc.mjs",
		".prettierrc.toml",
		"prettier.config.js",
		"prettier.config.cjs",
		"prettier.config.mjs",
	})
end

local function web_formatter()
	if uses_biome() then
		return { "biome" }
	end
	return { "prettier" }
end

return {
	formatters_by_ft = {
		javascript = web_formatter,
		javascriptreact = web_formatter,
		typescript = web_formatter,
		typescriptreact = web_formatter,
		json = web_formatter,
		jsonc = web_formatter,
		html = web_formatter,
		css = web_formatter,
		scss = { "prettier" },
		markdown = { "prettier" },
		yaml = { "prettier" },
		lua = { "stylua" },
		python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
		go = { "gofumpt" },
		rust = { "rustfmt" },
		proto = { "buf" },
	},
	-- format_on_save = {
	--   timeout_ms = 500,
	--   lsp_fallback = true,
	-- },
}

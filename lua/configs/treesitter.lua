local treesitter = require("nvim-treesitter")

-- The current nvim-treesitter (main branch) no longer supports
-- `ensure_installed` / `auto_install` / `highlight` / `indent` options.
-- Parsers must be installed explicitly and features are enabled via autocmds.
treesitter.setup()

local ensure_installed = {
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
	"helm",
	"proto",
}

treesitter.install(ensure_installed)

vim.treesitter.language.register("tsx", "typescriptreact")

local function setup_buffer(buf)
	local filetype = vim.bo[buf].filetype
	local lang = vim.treesitter.language.get_lang(filetype)
	if not lang or not vim.treesitter.language.add(lang) then
		return
	end

	vim.treesitter.start(buf)
	vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		setup_buffer(args.buf)
	end,
})

-- The plugin is lazy-loaded on BufReadPost/BufNewFile, so FileType has already
-- fired for the first buffer. Enable treesitter in already-open buffers too.
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
	if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == "" then
		setup_buffer(buf)
	end
end

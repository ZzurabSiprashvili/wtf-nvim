local o = vim.o

-- Editor behavior
o.laststatus = 3
o.showmode = false
o.clipboard = "unnamedplus"
o.mouse = "a"
o.timeoutlen = 400
o.undofile = true

-- Indentation
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

-- Search
o.ignorecase = true
o.smartcase = true
o.cursorline = true

-- Windows
o.splitbelow = true
o.splitright = true
o.signcolumn = "yes"

-- UI
o.number = true
o.relativenumber = true
o.termguicolors = true
o.foldmethod = "indent"
o.foldlevel = 99
o.foldlevelstart = 99

vim.opt.fillchars = { eob = " " }

-- Suppress unused providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.python3_host_prog = vim.fn.exepath("python3")

-- Theme highlight overrides
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("UserHighlights", { clear = true }),
  callback = function()
    vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#ff669c", bg = "#1a1a1a" })
  end,
})

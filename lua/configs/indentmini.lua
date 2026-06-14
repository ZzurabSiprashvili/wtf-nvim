require("indentmini").setup()

local hl = vim.api.nvim_set_hl
local function set_highlights()
  hl(0, "IndentLine", { fg = "#2e2e38" })
  hl(0, "IndentLineCurrent", { fg = "#4a4a55" })
  hl(0, "IndentLineContext", { fg = "#3a3a45" })
end

set_highlights()
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("IndentHighlights", { clear = true }),
  callback = set_highlights,
})

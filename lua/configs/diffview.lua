require("diffview").setup({
  view = { default = { layout = "diff2_horizontal" } },
})

local hl = vim.api.nvim_set_hl
local function set_highlights()
  hl(0, "DiffAdd", { bg = "#1a2a1a", fg = "#98c379" })
  hl(0, "DiffChange", { bg = "#2a2520", fg = "#e5c07b" })
  hl(0, "DiffDelete", { bg = "#2a1a1a", fg = "#e06c75" })
  hl(0, "DiffText", { bg = "#3a2a1a", fg = "#e5c07b" })
  hl(0, "DiffviewNormal", { bg = "#0f0f0f" })
  hl(0, "DiffviewWinSeparator", { fg = "#2a2a35", bg = "NONE" })
  hl(0, "DiffviewCursorLine", { bg = "#1a1a1a" })
  hl(0, "DiffviewFilePanelTitle", { fg = "#61dafb", bold = true })
  hl(0, "DiffviewFilePanelCounter", { fg = "#e5c07b", bold = true })
end

set_highlights()
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("DiffviewHighlights", { clear = true }),
  callback = set_highlights,
})

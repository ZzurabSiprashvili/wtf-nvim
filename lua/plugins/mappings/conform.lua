local map = vim.keymap.set

map("n", "++", function()
  require("conform").format()
end, { desc = "Format" })
map("v", "++", function()
  require("conform").format({ range = true })
end, { desc = "Format" })

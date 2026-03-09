vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("options")
require("mappings")
require("commands")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(require("plugins"), {
  install = { colorscheme = { "noctishc" } },
  checker = { enabled = true, notify = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "netrwPlugin", "tarPlugin", "tohtml",
        "tutor", "zipPlugin",
      },
    },
  },
})

require("lsp")
vim.cmd.colorscheme("monokai-night")

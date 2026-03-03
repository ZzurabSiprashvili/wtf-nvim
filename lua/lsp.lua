-- LSP servers are installed via Mason (no global installs)
-- Run :Mason to manage packages, :LspInstall to add more servers
-- Configs come from nvim-lspconfig, enable from mason-lspconfig

-- CursorHold fires after this many ms of no movement (for diagnostic hover)
vim.opt.updatetime = 300

-- Deduplicate diagnostics by message (tsgo + eslint often report the same error)
-- Format returns nil for duplicates so they're hidden from the float
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

-- Reset seen when opening float (format is called per diagnostic, reset before first)
local orig_open_float = vim.diagnostic.open_float
function vim.diagnostic.open_float(opts, ...)
  seen_msg = nil
  return orig_open_float(opts, ...)
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

-- LSP keybindings on attach
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
  end,
})

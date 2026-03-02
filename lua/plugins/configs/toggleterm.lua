local M = {}

local terms = nil

local function ensure_setup()
  if terms then return end

  require("toggleterm").setup({
    open_mapping = false,
    size = function(term)
      if term.direction == "horizontal" then return 15
      elseif term.direction == "vertical" then return vim.o.columns * 0.4
      end
    end,
  })

  local Terminal = require("toggleterm.terminal").Terminal
  terms = {
    bottom = Terminal:new({ direction = "horizontal" }),
    right = Terminal:new({ direction = "vertical" }),
    python_h = Terminal:new({ cmd = "python", direction = "horizontal" }),
    python_v = Terminal:new({ cmd = "python", direction = "vertical" }),
    node_h = Terminal:new({ cmd = "node", direction = "horizontal" }),
    node_v = Terminal:new({ cmd = "node", direction = "vertical" }),
    claude = Terminal:new({ cmd = "claude", direction = "float", float_opts = { border = "curved" } }),
    gemini = Terminal:new({ cmd = "gemini", direction = "float", float_opts = { border = "curved" } }),
  }
end

function M.toggle(name)
  ensure_setup()
  terms[name]:toggle()
end

return M

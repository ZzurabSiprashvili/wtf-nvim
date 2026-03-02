return {

  -- Core
  { "nvim-lua/plenary.nvim", lazy = true },

  -- Completion
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
      { "windwp/nvim-autopairs", opts = {} },
    },
    opts = function()
      return require("plugins.configs.blink")
    end,
  },

  -- Colorscheme
  { "iagorrr/noctis-high-contrast.nvim", lazy = false, priority = 1000 },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  -- Cursor animation
  { "sphamba/smear-cursor.nvim", event = "VeryLazy", opts = {} },

  -- Dashboard
  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      require("plugins.configs.alpha")
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    opts = require("plugins.configs.telescope"),
  },

  -- Flash (motion)
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
  },

  -- Neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = require("plugins.configs.neotree"),
  },

  -- Yazi
  {
    "mikavilpas/yazi.nvim",
    cmd = "Yazi",
    opts = require("plugins.configs.yazi"),
  },

  -- LazyGit
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
  },

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = require("plugins.configs.gitsigns"),
  },

  -- Diffview
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
    config = function()
      require("plugins.configs.diffview")
    end,
  },

  -- Indent guides
  {
    "nvimdev/indentmini.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.configs.indentmini")
    end,
  },

  -- Marks
  { "chentoast/marks.nvim", event = "VeryLazy", opts = {} },

  -- Scratchpad
  {
    "athar-qadri/scratchpad.nvim",
    cmd = "Scratch",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("scratchpad"):setup()
    end,
  },

  -- Trouble (diagnostics list)
  { "folke/trouble.nvim", cmd = "Trouble", opts = {} },

  -- Outline
  { "hedyhli/outline.nvim", cmd = "Outline", opts = {} },

  -- Todo comments
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "VeryLazy",
    opts = require("plugins.configs.todo-comments"),
  },

  -- Which-key
  { "folke/which-key.nvim", event = "VeryLazy" },

  -- Terminal
  { "akinsho/toggleterm.nvim", lazy = true },

  -- Leetcode
  {
    "kawre/leetcode.nvim",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {},
  },

  -- Copilot
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      require("plugins.configs.copilot")
    end,
  },

  -- Emmet
  { "olrtg/nvim-emmet", lazy = true },
}

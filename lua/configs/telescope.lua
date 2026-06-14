return {
  defaults = {
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = { prompt_position = "top" },
    },
  },
  pickers = {
    find_files = { hidden = true },
    oldfiles = { only_cwd = true },
    buffers = { only_cwd = true },
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  lazy = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  branch = "main",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  opts = {
    -- Highlight and indent enabled
    highlight = { enable = true },
    indent = { enable = true },
    -- Ensure these parsers are installed
    ensure_installed = "all",
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = "<nop>",
        node_decremental = "<bs>",
      },
    },
  },
}

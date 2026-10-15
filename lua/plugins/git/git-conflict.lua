return {
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {
      -- Buffer-local mappings: co (ours), ct (theirs), cb (both), c0 (none).
      default_mappings = true,
      list_opener = function()
        require("telescope.builtin").quickfix()
      end,
      highlights = {
        incoming = "DiffAdd",
        current = "DiffText",
      },
    },
    keys = {
      { "<leader>gm", "<cmd>GitConflictListQf<cr>", desc = "List merge conflicts" },
    },
  },
}

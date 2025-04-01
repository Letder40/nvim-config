require 'nvim-treesitter.configs'.setup {
    -- language parsers required
    ensure_installed = {
        "rust",
        "asm",
        "c",
        "go",
        "zig",
        "lua",
        "python",
        "bash",
        "sql",
        "html",
        "css",
        "typescript",
        "javascript",
        "php"
    },
>>>>>>> 67113a9 (lspconf upd)
  sync_install = true,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

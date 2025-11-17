-- plugin manager
require("plugins")
--
-- theme 
require("configs/onedark-config")
vim.cmd [[colorscheme onedark]]

-- keybinds
require("keybinds")

-- configs
require("config")

-- lsp
require("configs.lsp-config")
require("configs.treesitter-config")

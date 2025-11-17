-- plugin manager
require("plugins")
--
-- theme 
require("configs/onedark-config")
vim.cmd [[colorscheme onedark]]

-- keybinds
require("keybinds")

-- lsp 
require("configs.lsp-config")

-- configs
require("config")

-- theme 
require("configs/onedark-config")
vim.cmd [[colorscheme onedark]]

-- keybinds
require("keybinds")

-- configs
require("config")

-- plugin manager
require("plugins")

-- configs
require("configs.defaults")
require("configs.mason-config")

-- lsp
require("configs.lsp-config")

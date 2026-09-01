vim.g.mapleader = " "

-- best remaps ever
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Copy to clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+yy")

-- Paste from clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p")
vim.keymap.set({ "n", "v" }, "<leader>P", "\"+P")

-- quickfix
vim.keymap.set({ "n", "v" }, "<M-j>", function() vim.cmd('cnext') end)
vim.keymap.set({ "n", "v" }, "<M-k>", function() vim.cmd('cprev') end)

-- telescope
-- harpoon
local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-h>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():next() end)
--

-- zen
local zen = require('zen-mode')
vim.keymap.set("n", "<leader>zz", function() zen.toggle() end)

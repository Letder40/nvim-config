vim.g.mapleader = " "

-- Best remaps ever, thanks primeagen
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Copy to clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+yy")

-- Paste from clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p")
vim.keymap.set({ "n", "v" }, "<leader>P", "\"+P")

-- magic moves
vim.keymap.set("n", "<C-j>", ":m .+1 <CR>==", { desc = "Move line down and indent" })
vim.keymap.set("n", "<C-k>", ":m .-2 <CR>==", { desc = "Move line up and indent" })
vim.keymap.set("x", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down and indent" })
vim.keymap.set("x", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up and indent" })

-- quickfix
vim.keymap.set({ "n", "v" }, "<M-j>", function() vim.cmd('cnext', { output=false }) end)
vim.keymap.set({ "n", "v" }, "<M-k>", function() vim.cmd('cprev', {output=false}) end)
vim.keymap.set({ "n", "v" }, "<M-o>", function() vim.cmd('copen') end)
vim.keymap.set({ "n", "v" }, "<M-c>", function() vim.cmd('cclose') end)

-- zen
local zen = require('zen-mode')
vim.keymap.set("n", "<leader>zz", function() zen.toggle() end)

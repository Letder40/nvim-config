local noremap = vim.keymap.set

-- exit remap
noremap({ "i", "c" }, "jk", "<esc>")
noremap({ "i", "c" }, "<esc>", "")
noremap("n", "<C-CR>", ":term<CR>")
noremap("t", "jk", [[<C-\><C-n>]])

-- reload
noremap("n", "<leader>R", "<cmd>cq 120<cr>", { desc = "neovim restart - needs 120 errcode custom handler" })

-- Best remaps ever, thanks primeagen
noremap("n", "<C-u>", "<C-u>zz")
noremap("n", "<C-d>", "<C-d>zz")

-- Copy to clipboard
noremap("v", "<leader>y", '"+y')
noremap("n", "<leader>y", '"+yy')

-- Paste from clipboard
noremap({ "n", "v" }, "<leader>p", '"+p')
noremap({ "n", "v" }, "<leader>P", '"+P')

-- splits
noremap("n", "<C-s>v", ":vsplit<CR>")
noremap("n", "<C-s>h", ":split<CR>")

noremap("n", "<C-h>", "<C-w>h")
noremap("n", "<C-j>", "<C-w>j")
noremap("n", "<C-k>", "<C-w>k")
noremap("n", "<C-l>", "<C-w>l")

-- magic moves
noremap("n", "<A-S-k>", ":m .-2 <CR>==", { desc = "Move line up and indent" })
noremap("n", "<A-S-j>", ":m .+1 <CR>==", { desc = "Move line down and indent" })
noremap("x", "<A-S-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up and indent" })
noremap("x", "<A-S-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down and indent" })

-- quickfix
noremap({ "n", "v" }, "<M-j>", function()
	vim.cmd("cnext", { output = false })
end)
noremap({ "n", "v" }, "<M-k>", function()
	vim.cmd("cprev", { output = false })
end)
noremap({ "n", "v" }, "<leader>qo", function()
	vim.cmd("copen")
end)
noremap({ "n", "v" }, "<leader>qc", function()
	vim.cmd("cclose")
end)

-- lsp
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local bufnr = event.buf
		local opts = { noremap = true, silent = true, buffer = bufnr }

		noremap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		noremap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		noremap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		noremap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		noremap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		noremap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		noremap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		noremap("n", "<leader>rb", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		noremap("n", "<A-f>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		noremap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		noremap("n", "<leader>ie", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
		noremap("n", "<leader>in", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
		noremap("n", "<leader>ip", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
		noremap("n", "<leader>ep", "<cmd>lua vim.diagnostic.jump({ count = -1, float = true })<cr>", opts)
		noremap("n", "<leader>en", "<cmd>lua vim.diagnostic.jump({ count = 1, float = true })<cr>", opts)
	end,
})

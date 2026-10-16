vim.api.nvim_create_user_command("LspLog", function()
    vim.cmd("tabedit " .. vim.lsp.log.get_filename())
end, {})

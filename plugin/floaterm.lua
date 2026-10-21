local state = {
    win = -1,
    buf = -1,
}

local function get_floating_position()
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)

    local start_col = (math.floor(vim.o.columns - width) / 2)
    local start_row = (math.floor(vim.o.lines - height) / 2)

    return {
        relative = "editor",
        width = width,
        height = height,
        col = start_col,
        row = start_row,
    }
end

local function create_floating_window()
    if not vim.api.nvim_buf_is_valid(state.buf) then
        state.buf = vim.api.nvim_create_buf(false, true)
    end

    local winconfig = {
        border = "rounded",
        style = "minimal",
    }

    winconfig = vim.tbl_extend("force", winconfig, get_floating_position())

    state.win = vim.api.nvim_open_win(state.buf, true, winconfig)

    vim.api.nvim_create_autocmd('WinResized', {
        callback = function()
            if state.win == vim.api.nvim_get_current_win() then
                vim.api.nvim_win_set_config(state.win, get_floating_position())
            end
        end
    })

    vim.api.nvim_set_hl(0, "FloatTermBg", { bg = "NONE", blend = 5 })
    vim.api.nvim_set_hl(0, "FloatTermBorder", { fg = "#2182ff" })

    vim.wo[state.win].winhighlight = "Normal:FloatTermBg,FloatBorder:FloatTermBorder"
end

local function toggle_terminal()
    if not vim.api.nvim_win_is_valid(state.win) then
        create_floating_window()
        if vim.bo[state.buf].buftype ~= "terminal" then
            vim.cmd.term()
            vim.api.nvim_input("i")
        end
    else
        vim.api.nvim_win_hide(state.win)
    end
end

vim.api.nvim_create_user_command("ToggleTerm", toggle_terminal, {})
vim.keymap.set({ "n", "t" }, "<C-t>", toggle_terminal, { remap = false })

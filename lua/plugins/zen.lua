return {
    'folke/zen-mode.nvim',
    opts = {
        {
            window = {
                backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                width = 180, -- width of the Zen window
                height = 1, -- height of the Zen window
                options = {
                    -- signcolumn = "no", -- disable signcolumn
                    -- number = false, -- disable number column
                    -- relativenumber = false, -- disable relative numbers
                    -- cursorline = false, -- disable cursorline
                    -- cursorcolumn = false, -- disable cursor column
                    -- foldcolumn = "0", -- disable fold column
                    -- list = false, -- disable whitespace characters
                },
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = false,
                    showcmd = false,
                    laststatus = 0,
                },
                twilight = { enabled = false },
                gitsigns = { enabled = false },
                tmux = { enabled = false },
                todo = { enabled = false },
                -- kitty
                -- - allow_remote_control socket-only
                -- - listen_on unix:/tmp/kitty
                kitty = {
                    enabled = true,
                    font = "+2",
                },
            },
            on_open = function(win)
                win.close()
            end,
            -- callback where you can add custom code when the Zen window closes
            on_close = function()
            end,
        }
    }
}

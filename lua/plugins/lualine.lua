return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        --- theme
        local colors = {
          default_fg    = "#ccd2db",
          normal_bg     = '#32aaff',
          insert_bg     = '#ffffff',
          default_bg    = '#2c3043',
          color1        = '#ff5874',
        }

        local custom_theme = {
          normal = {
            a = { fg = colors.default_fg, bg = colors.normal_bg, gui = 'bold' },
            b = { fg = colors.default_fg, bg = colors.default_bg },
            c = { fg = colors.default_fg, bg = colors.default_bg },
          },
          insert = {
            a = { fg = colors.insert_bg, bg = colors.normal_bg, gui = 'bold' },
            b = { fg = colors.default_fg, bg = colors.default_bg },
          },
          replace = {
            a = { fg = colors.color0, bg = colors.color1, gui = 'bold' },
            b = { fg = colors.default_fg, bg = colors.default_bg },
          },
          visual = {
            a = { fg = colors.color0, bg = colors.color6, gui = 'bold' },
            b = { fg = colors.default_fg, bg = colors.default_bg },
          },
          inactive = {
            a = { fg = colors.color6, bg = colors.default_bg, gui = 'bold' },
            b = { fg = colors.color6, bg = colors.default_bg },
            c = { fg = colors.color6, bg = colors.default_bg },
          },
        }
        ---

        require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = custom_theme,
            -- component_separators = { left = '', right = ''},
            component_separators = { left = '|', right = '|'},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            always_show_tabline = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
                refresh_time = 16, -- ~120fps
                events = {
                    'WinEnter',
                    'BufEnter',
                    'BufWritePost',
                    'SessionLoadPost',
                    'FileChangedShellPost',
                    'VimResized',
                    'Filetype',
                    'CursorMoved',
                    'CursorMovedI',
                    'ModeChanged',
                },
            },
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'fileformat', 'filetype', 'lsp_status'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    })
    end
}

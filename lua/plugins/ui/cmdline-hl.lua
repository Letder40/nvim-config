return {
    'Sam-programs/cmdline-hl.nvim',
    event = 'VimEnter',
    config = function()
        -- str is unmapped keys do with that knowledge what you will
        -- read aliases.md for examples
        -- ["cd"] = { str = "Cd" },
        local cmdline_hl = require('cmdline-hl')
        cmdline_hl.setup({
            custom_types = {
                ['Cd'] = { show_cmd = true }
            },
            aliases = {
                ['cd'] = { str = 'Cd' }
            }
        })
        return {
            aliases = {

            }
        }
    end
}

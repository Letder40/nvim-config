require('vim._core.ui2').enable({
    enable = true,

    msg = {
        ---@type 'cmd'|'msg'
        ---@type string|table<string, 'cmd'|'msg'|'pager'>

        targets = 'cmd',

        cmd = {          -- Options related to messages in the cmdline window.
            height = 0.5 -- Maximum height while expanded for messages beyond 'cmdheight'.
        },

        dialog = {        -- Options related to dialog window.
            height = 0.5, -- Maximum height.
        },

        msg = {             -- Options related to msg window.
            height = 0.5,   -- Maximum height.
            timeout = 4000, -- Time a message is visible in the message window.
        },
    },
})

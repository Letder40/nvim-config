return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { "nvim-lua/plenary.nvim" },
    lazy = true,
    config = function ()
        local harpoon = require("harpoon")
        harpoon:setup()

        local harpoon_extensions = require("harpoon.extensions")
        harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-h>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<C-l>", function() harpoon:list():next() end)
    end,
    keys = {
        {"<leader>a", nil},
        {"<C-e>", nil},
        {"<C-h>", nil},
        {"<C-l>", nil},
    }
}

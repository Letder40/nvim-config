return {
	'navarasu/onedark.nvim',
	lazy = false,
	priority = 1000,

	config = function()
		require('onedark').setup  {
		    style = 'deep',
		    transparent = true, 
		    term_colors = true,
		    ending_tildes = false,
		    cmp_itemkind_reverse = false,

		    toggle_style_key = "<leader>ts",
		    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},

		    code_style = {
			comments = 'italic',
			keywords = 'bold',
			functions = 'none',
			strings = 'none',
			variables = 'none'
		    },

		    lualine = {
			transparent = false, -- lualine center bar transparency
		    },

		    -- Custom Highlights --
		    colors = {}, -- Override default colors
		    highlights = {
			Tag = { fg= "#0fc3ff" },
			["@_jsx_element.tsx"] = { fg = "#fffff" },
			["@tag.attribute.tsx"] = { fg = "#ea41ea" }
		    }, -- Override highlight groups

		    diagnostics = {
			darker = true,
			undercurl = true,
			background = true,
		    },
		}

		vim.cmd("colorscheme onedark")
	end
}

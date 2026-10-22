return {
	"saghen/blink.cmp",

	dependencies = {
		"saghen/blink.lib",
		-- optional: provides snippets for the snippet source
		"rafamadriz/friendly-snippets",
	},
	build = function()
		require("blink.cmp").build():pwait()
	end,

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		appearance = {
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",

			kind_icons = {
				Text = "󰉿",
				Method = "󰊕",
				Function = "󰊕",
				Constructor = "󰒓",

				Field = "󰜢",
				Variable = "󰆦",
				Property = "󰖷",

				Class = "󱡠",
				Interface = "󱡠",
				Struct = "󱡠",
				Module = "󰅩",

				Unit = "󰪚",
				Value = "󰦨",
				Enum = "󰦨",
				EnumMember = "󰦨",

				Keyword = "󰻾",
				Constant = "󰏿",

				Snippet = "󰗧",
				Color = "󰏘",
				File = "󰈔",
				Reference = "󰬲",
				Folder = "󰉋",
				Event = "󱐋",
				Operator = "󰪚",
				TypeParameter = "󰬛",
			},
		},
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			preset = "default",
			["<C-l>"] = { "hide", "fallback" },
		},

		completion = {
			documentation = {
				auto_show = true,
			},
			trigger = {
				show_on_backspace = true,
			},
		},

		cmdline = {
			keymap = { preset = "inherit" },
			completion = { menu = { auto_show = false } },
		},

		-- (Default) list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = { default = { "lsp", "path", "snippets", "buffer" } },
		fuzzy = { implementation = "rust" },
	},
}

return {
	"saghen/blink.pairs",
	dependencies = "saghen/blink.lib",

	version = "*",
	build = function()
		require("blink.pairs").download():pwait(60000)
	end,

	init = function()
		local function set_highlights()
			vim.api.nvim_set_hl(0, "BlinkPairsWhite", { ctermfg = 12, fg = "#ccc6cb", default = true })
			vim.api.nvim_set_hl(0, "BlinkPairsOrange", { ctermfg = 15, fg = "#d65d0e", default = true })
			vim.api.nvim_set_hl(0, "BlinkPairsBlue", { ctermfg = 12, fg = "#0041C2", default = true })
			vim.api.nvim_set_hl(0, "BlinkPairsPurple", { ctermfg = 13, fg = "#8968cd", default = true })
			vim.api.nvim_set_hl(0, "BlinkPairsUnmatched", { ctermfg = 9, fg = "#ff003c", default = true })
			vim.api.nvim_set_hl(0, "BlinkPairsMatchParen", { link = "MatchParen", default = true })
		end

		set_highlights()
		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("blink_pairs_highlights", {}),
			callback = set_highlights,
		})
	end,
	--- @module 'blink.pairs'
	--- @type blink.pairs.Config
	opts = {
		mappings = {
			-- you can call require("blink.pairs.mappings").enable()
			-- and require("blink.pairs.mappings").disable()
			enabled = true,
			cmdline = true,
			-- or disable with `vim.g.pairs = false` (global) and `vim.b.pairs = false` (per-buffer)
			-- and/or with `vim.g.blink_pairs = false` and `vim.b.blink_pairs = false`
			disabled_filetypes = {},
			wrap = {
				-- move closing pair via motion
				["<C-b>"] = "treesitter",
				-- move opening pair via motion
				["<C-S-b>"] = "treesitter_reverse",
				-- set to 'treesitter' or 'treesitter_reverse' to use treesitter instead of motions
				-- set to nil, '' or false to disable the mapping
				-- for normal mode mappings, only supports 'motion' and 'motion_reverse'
				-- normal_mode = {}
			},
			-- see the defaults:
			-- https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L52
			pairs = {},
		},
		highlights = {
			enabled = false,
			cmdline = true,
			groups = { "BlinkPairs" },
			unmatched_group = "BlinkPairsUnmatched",

			-- highlights matching pairs under the cursor
			matchparen = {
				enabled = true,
				-- known issue where typing won't update matchparen highlight, disabled by default
				cmdline = false,
				-- also include pairs not on top of the cursor, but surrounding the cursor
				-- optionally only for the given token types, which must be a subset of `enabled`,
				-- if defined
				include_surrounding = false,
				group = "BlinkPairsMatchParen",
				priority = 250,
			},
		},
		debug = false,
	},
}

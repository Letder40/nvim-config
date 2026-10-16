return {
	filetypes = {
		"html",
		"mdx",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"vue",
		"svelte",
		"rust",
	},
	init_options = {
		userLanguages = {
			rust = "html",
		},
	},
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					[[class\s*=\s*\"([^\"]*)\"]],
					[[clx!\s*\{\s*\"([^\"]*)\"\s*\}]],
				},
			},
		},
	},
}

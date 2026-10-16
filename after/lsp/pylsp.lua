return {
	filetypes = { "python" },
	settings = {
		pylsp = {
			configurationSources = { "flake8" },
			plugins = {
				jedi_completion = { fuzzy = true, include_params = false },
				jedi_signature_help = { enabled = true },
				pyflakes = { enabled = false },
				pycodestyle = { enabled = false },
				mccabe = { enabled = false },
				flake8 = { enabled = true, maxLineLength = 100 },
				pylsp_mypy = { enabled = true },
				yapf = { enabled = true },
			},
		},
	},
}

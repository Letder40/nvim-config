return {
	settings = {
		typescript = {
			updateImportsOnFileMove = { enabled = "always" },
			inlayHints = {
				parameterNames = { enabled = "all" },
				variableTypes = { enabled = true },
			},
		},
		javascript = {
			updateImportsOnFileMove = { enabled = "always" },
		},
		vtsls = {
			-- Esto fuerza a usar el TypeScript local de tu node_modules si existe
			autoUseWorkspaceTsdk = true,
			experimental = {
				-- Habilita características rápidas de edición del servidor vtsls
				completion = { enableSignatures = true },
			},
		},
	},
}

return {
	filetypes = { "c", "cpp", "c++", "h", "hpp" },
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--enable-config",
		"--offset-encoding=utf-16",
	},
}

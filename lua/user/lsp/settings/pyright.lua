local util = require("lspconfig.util")

local root_files = {
    "src",
	"pyproject.toml",
	"setup.py",
	"setup.cfg",
	"requirements.txt",
	"Pipfile",
	"pyrightconfig.json",
	".gitlab-ci.yml",
}

return {
	default_config = {
		root_dir = util.root_pattern(unpack(root_files)),
	},
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off",
			},
		},
	},
}

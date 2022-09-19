-- try to use the current active virtual env for python
local python_virtual_env = os.getenv("VIRTUAL_ENV")
if python_virtual_env == nil then
	python_virtual_env = "python"
else
	python_virtual_env = python_virtual_env .. "/bin/python"
end

require("jaq-nvim").setup({
	cmds = {
		-- Uses vim commands
		internal = {
			lua = "luafile %",
			vim = "source %",
		},

		-- Uses shell commands
		external = {
			python = python_virtual_env .. " %",
			sh = "sh %",
		},
	},

	behavior = {
		-- Default type
		default = "terminal",

		-- Start in insert mode
		startinsert = false,

		-- Use `wincmd p` on startup
		wincmd = false,

		-- Auto-save files
		autosave = false,
	},

	ui = {
		float = {
			-- See ':h nvim_open_win'
			border = "none",

			-- See ':h winhl'
			winhl = "Normal",
			borderhl = "FloatBorder",

			-- See ':h winblend'
			winblend = 0,

			-- Num from `0-1` for measurements
			height = 0.8,
			width = 0.8,
			x = 0.5,
			y = 0.5,
		},

		terminal = {
			-- Window position
			position = "bot",

			-- Window size
			size = 10,

			-- Disable line numbers
			line_no = false,
		},

		quickfix = {
			-- Window position
			position = "bot",

			-- Window size
			size = 10,
		},
	},
})

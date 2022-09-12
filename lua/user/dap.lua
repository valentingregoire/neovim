-- https://github.com/rcarriga/nvim-dap-ui

local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
	return
end

local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then
	return
end

dap_install.setup({})

dap_install.config("python", {
	type = "executable",
	command = "/home/valentin/.virtualenvs/debugpy/bin/python",
	args = { "-m", "debugpy.adaptber" },
})
-- add other configs here

-- Adapters
-- dap.adapters.python = {
--     type = "executable",
--     command = "/home/valentin/.virtualenvs/debugpy/bin/python",
--     args = { "-m", "debugpy.adaptber" },
-- }

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		pythonPath = function()
			-- return "/home/valentin/.virtualenvs/${workspaceFolderBasename}"
			return "/home/valentin/.virtualenvs/appstore_portal_back_end/bin/python"
		end,
	},
}

dapui.setup({
	layouts = {
		{
			elements = {
				"watches",
				{ id = "scopes", size = 0.25 },
				"stacks",
				"breakpoints",
			},
			size = 0.25,
			position = "right",
		},
        {
            elements = {
                "console",
                { id = "repl", size = 0.2}
            },
            size = 40,
            position = "bottom",
        },
	},
    floating = {
        border = "rounded",
    },
	-- sidebar = {
	-- 	elements = {
	-- 		{
	-- 			id = "scopes",
	-- 			size = 0.25, -- Can be float or integer > 1
	-- 		},
	-- 		{ id = "breakpoints", size = 0.25 },
	-- 	},
	-- 	size = 40,
	-- 	position = "right", -- Can be "left", "right", "top", "bottom"
	-- },
	-- tray = {
	-- 	elements = {},
	-- },
})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

-- automatically open gui
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

---- automatically close gui when terminated
-- dap.listeners.before.event_terminated["dapui_config"] = function()
-- 	dapui.close()
-- end
--
---- automatically close when exited
-- dap.listeners.before.event_exited["dapui_config"] = function()
-- 	dapui.close()
-- end

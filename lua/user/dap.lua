-- https://github.com/rcarriga/nvim-dap-ui
local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
	return
end

--[[ local dap_install_status_ok, dap_install = pcall(require, "dap-install") ]]
--[[ if not dap_install_status_ok then ]]
--[[ 	return ]]
--[[ end ]]

local dap_virtual_text_status_ok, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not dap_virtual_text_status_ok then
	return
end

--[[ dap_install.setup({}) ]]

--[[ dap_install.config("python", { ]]
--[[ 	type = "executable", ]]
--[[ 	command = "/home/valentin/.virtualenvs/debugpy/bin/python", ]]
--[[ 	args = { "-m", "debugpy.adaptber" }, ]]
--[[ }) ]]
-- add other configs here

-- Adapters
dap.adapters.python = {
	type = "executable",
	command = os.getenv("HOME") .. "/.virtualenvs/debugpy/bin/python",
	args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Default",
		pythonPath = PYTHON_VIRTUAL_ENV(),
		program = "${file}",
	},
    {
        type = "python",
        request = "launch",
        name = "cwd/cwd",
        pythonPath = PYTHON_VIRTUAL_ENV(),
        program = "${file}",
        justMyCode = false,
        cwd = "${workspaceFolder}/{workspaceFolderBasename}",
    },
	{
		type = "python",
		request = "launch",
		name = "Tests",
		pythonPath = PYTHON_VIRTUAL_ENV(),
		program = "${file}",
		justMyCode = false,
        --[[ module = "nose2", ]]
		--[[ cwd = "${workspaceFolder}/src", ]]
        cwd = "${workspaceFolder}/src",
		env = {
			ARANGO_DB = "appstore-test",
		},
	},
    {
        type = "python",
        request = "launch",
        name = "Kubectl",
        pythonPath = PYTHON_VIRTUAL_ENV(),
        program = "${file}",
        justMyCode = true,
        cwd = "${workspaceFolder}/kubectl_app_store",
    }
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
				"repl",
				--[[ { id = "repl", size = 0.7 }, ]]
				--[[ "console", ]]
			},
			size = 0.3,
			position = "bottom",
		},
	},
	floating = {
		border = "rounded",
	},
})

dap_virtual_text.setup({
	--[[ virt_text_pos = "right_align", -- "eol" | "overlay" | "right_align" ]]
})

--[[ vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }) ]]
--[[ vim.highlight.create('DapBreakpoint', { ctermbg=0, guifg='#e68585', guibg='#291f1f' }, false) ]]
vim.highlight.create("DapBreakpoint", { ctermbg = 0, guifg = "", guibg = "#4B1515" }, false)
vim.highlight.create("DapLogPoint", { ctermbg = 0, guifg = "", guibg = "#19232b" }, false)
vim.highlight.create("DapStopped", { ctermbg = 0, guifg = "", guibg = "#1b2916" }, false)

vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "", texthl = "DiagnosticSignError", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapBreakpointCondition",
	{ text = "ﳁ", texthl = "DiagnosticSignError", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapBreakpointRejected",
	{ text = "", texthl = "DiagnosticSignError", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
	"DapLogPoint",
	{ text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
)
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

local dap_python_status_ok, dap_python = pcall(require, "dap_python")
if not dap_python_status_ok then
	return
end

dap_python.setup(os.getenv("HOME") .. "/.virtualenvs/debugpy/bin/python")
--[[ local test_runners = dap_python.test_runners ]]
--[[ test_runners.nose2 = function(classname, methodname, opts) ]]
--[[ 	local args = { classname, methodname } ]]
--[[ 	return "nose2", args ]]
--[[ end ]]
dap_python.test_runner = "unittest" -- unittest | pytest | django

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

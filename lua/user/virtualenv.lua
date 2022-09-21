-- get the python path for the current virtual environment
function PYTHON_VIRTUAL_ENV()
	local python_virtual_env = os.getenv("VIRTUAL_ENV")
	if python_virtual_env == nil then
		return "python"
	else
		return python_virtual_env .. "/bin/python"
	end
end

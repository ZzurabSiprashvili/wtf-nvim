local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

local codelldb = vim.fn.stdpath("data") .. "/mason/bin/codelldb"

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = codelldb,
		args = { "--port", "${port}" },
	},
}

dap.configurations.rust = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
	{
		name = "Launch cargo test",
		type = "codelldb",
		request = "launch",
		program = function()
			local cargo = vim.fn.system("cargo test --no-run 2>&1 | grep -oP '(?<=Executable unittests src/lib.rs \\()[^)]+' | head -1 | tr -d '\\n'")
			if cargo == "" then
				cargo = vim.fn.system("cargo test --no-run 2>&1 | grep -oP '(?<=Executable: )[^ ]+' | head -1 | tr -d '\\n'")
			end
			local file = vim.fn.input("Path to test binary: ", cargo, "file")
			return file
		end,
		args = function()
			local args = vim.fn.input("Test args: ", "--nocapture")
			return vim.fn.split(args, "%s+")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

vim.keymap.set("n", "<F5>", function()
	dap.continue()
end)
vim.keymap.set("n", "<F10>", function()
	dap.step_over()
end)
vim.keymap.set("n", "<F11>", function()
	dap.step_into()
end)
vim.keymap.set("n", "<F12>", function()
	dap.step_out()
end)
vim.keymap.set("n", "<leader>b", function()
	dap.toggle_breakpoint()
end)
vim.keymap.set("n", "<leader>B", function()
	dap.set_breakpoint()
end)
vim.keymap.set("n", "<leader>lp", function()
	dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<leader>dr", function()
	dap.repl.open()
end)
vim.keymap.set("n", "<leader>dl", function()
	dap.run_last()
end)
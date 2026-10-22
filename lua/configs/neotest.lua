local neotest = require("neotest")

neotest.setup({
	adapters = {
		-- Uses `cargo nextest`; requires the cargo-nextest binary.
		require("neotest-rust"),
	},
})

local map = vim.keymap.set

map("n", "<leader>tr", function()
	neotest.run.run()
end, { desc = "Test: run nearest" })

map("n", "<leader>tf", function()
	neotest.run.run(vim.fn.expand("%"))
end, { desc = "Test: run file" })

map("n", "<leader>tl", function()
	neotest.run.run_last()
end, { desc = "Test: rerun last" })

map("n", "<leader>tx", function()
	neotest.run.stop()
end, { desc = "Test: stop nearest" })

map("n", "<leader>to", function()
	neotest.output_panel.toggle()
end, { desc = "Test: output panel" })

map("n", "<leader>ts", function()
	neotest.summary.toggle()
end, { desc = "Test: summary" })

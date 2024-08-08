return {
    "mfussenegger/nvim-dap",
    config = function()

	local dap = require("dap");
	local wk = require('which-key');

	wk.add({
	    '<leader>d',
	    --group = "Debug",
	    function() dap.toggle_breakpoint() end,
	    desc = "Toggle breakpoint",
	    icon = {
		icon = "",
		hl = "",
		color = "red"
	    },
	});

	wk.add({
	    '<leader>D',
	    function()
		dap.repl.open();
	    end,
	    icon = {
		icon = "󰒓",
		hl = "",
		color = "red"
	    }
	});

	wk.add({
	    '<F5>',
	    function() dap.continue() end,
	    desc = 'Continue/Start debugging',
	    --group = 'Debug',
	    icon = {
		icon = "",
		hl = "",
		color = "green"
	    }
	});

	wk.add({
	    '<F10>',
	    function() dap.step_over() end,
	    desc = 'Step over',
	    -- group = 'Debug',
	    icon = {
		icon = "",
		hl = "",
		color = "blue"
	    }
	});

	wk.add({
	    '<F11>',
	    function() dap.step_into() end,
	    desc = 'Step into',
	    -- group = 'Debug',
	    icon = {
		icon = "",
		hl = "",
		color = "blue"
	    }
	});

	-- Adapter configuration
	dap.adapters.gdb = {
	    type = "executable",
	    command = "gdb",
	    args = { "-i", "dap" }
	};

	dap.configurations.c = {
	    {
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = function()
		    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = true,
	    },
	};
    end
}

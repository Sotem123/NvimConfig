return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap");
		local wk = require('which-key');
		local widgets = require('dap.ui.widgets');
		local fh = require("file_helpers");
		local bh = require("buffer_helpers");

		local threadBar = nil;
		local frameBar = nil;
		local scopeBar = nil;

		wk.add(
			{
				'<leader>d',
				group = "Debug",
				icon = {
					icon = '󰒓',
					hl = '',
					color = 'green'
				},
				{
					'<leader>D',
					function() dap.toggle_breakpoint() end,
					desc = "Toggle breakpoint.",
					icon = {
						icon = "",
						hl = "",
						color = "red"
					},
				},
				{
					'<leader>dd',
					function() dap.toggle_breakpoint() end,
					desc = "Toggle breakpoint.",
					icon = {
						icon = "",
						hl = "",
						color = "red"
					},
				},
				{
					'<leader>de',
					function()

						-- local expression = io.input('Expression: ');
						--
						-- if (expression == nil) then
						--
						-- 	print('Please provde a valid expression.');
						-- 	return;
						-- end
						--
						-- expression = '#include <stdio.h>\n' .. 'printf(%s,' .. expression .. ')';
						--
						widgets.hover(vim.fn.expand("<cexpr>"));
					end,
					desc = "Evaluate the expression.",
					icon = {
						icon = "󰙵",
						hl = "",
						color = "green"
					},
				},
				{
					'<leader>dt',
					function()
						dap.repl.toggle();
					end,
					desc = "Toggle the debug terminal.",
					icon = {
						icon = "󰙵",
						hl = "",
						color = "green"
					},
				},
				{
					'<leader>d<S-t>',
					function()
						dap.terminate();
					end,
					desc = "Terminate the current debugging session.",
					icon = {
						icon = "",
						hl = "",
						color = "red"
					},
				},
				{
					'<leader>dL',
					--group = "Debug",
					function() dap.list_breakpoints() end,
					desc = "List all breakpoints and log points.",
					icon = {
						icon = "󰉹",
						hl = "",
						color = "blue"
					},
				},
				{
					'<leader>dC',
					--group = "Debug",
					function() dap.clear_breakpoints() end,
					desc = "Removes all breakpoints.",
					icon = {
						icon = "",
						hl = "",
						color = "red"
					},
				},
				{
					'<leader>dE',
					--group = "Debug",
					function() dap.set_exception_breakpoints() end,
					desc = "Ask user to set breakpoints on exceptions.",
					icon = {
						icon = "",
						hl = "",
						color = "red"
					},
				},
				{
					'<leader>di',
					--group = "Debug",
					function()
						widgets.hover();
					end,
					desc = "View information about the current item in a popup.",
					icon = {
						icon = "",
						hl = "",
						color = "blue"
					},
				},
				{
					'<leader>df',
					--group = "Debug",
					function()

						if (frameBar == nil) then
							frameBar = widgets.sidebar(widgets.frames);
						end
						frameBar.toggle();
					end,
					desc = "View information about the current frame.",
					icon = {
						icon = "󰋴",
						hl = "",
						color = "blue"
					},
				},
				{
					'<leader>ds',
					--group = "Debug",
					function()

						if (scopeBar == nil) then
							scopeBar = widgets.sidebar(widgets.scopes);
						end
						scopeBar.open();
					end,
					desc = "View information about the current scopes.",
					icon = {
						icon = "󱉶",
						hl = "",
						color = "blue"
					},
				},
				{
					'<leader>dt',
					--group = "Debug",
					function()

						if (threadBar == nil) then
							threadBar = widgets.sidebar(widgets.threads);
						end
						threadBar.open();
					end,
					desc = "View information about the current threads.",
					icon = {
						icon = "󱉶",
						hl = "",
						color = "blue"
					},
				},
				{
					'<leader>dj',
					--group = "Debug",
					function() dap.focus_frame() end,
					desc = "Focus to the current frame.",
					icon = {
						icon = "󰋱",
						hl = "",
						color = "yellow"
					},
				},
			});

		wk.add({
			-- {
			-- 	'<S-F5>',
			-- 	function()
			-- 		dap.restart();
			-- 	end,
			-- 	desc = 'Continue/Start debugging',
			-- 	--group = 'Debug',
			-- 	icon = {
			-- 		icon = "",
			-- 		hl = "",
			-- 		color = "green"
			-- 	}
			-- },
			-- {
			-- 	'<C-F5>',
			-- 	function()
			-- 		dap.run_last();
			-- 	end,
			-- 	desc = 'Continue/Start debugging',
			-- 	--group = 'Debug',
			-- 	icon = {
			-- 		icon = "",
			-- 		hl = "",
			-- 		color = "green"
			-- 	}
			-- },
			{
				'<F5>',
				function()
					dap.continue();
				end,
				desc = 'Continue/Start debugging',
				--group = 'Debug',
				icon = {
					icon = "",
					hl = "",
					color = "green"
				}
			},
			{
				'<F10>',
				function() dap.step_over() end,
				desc = 'Step over',
				-- group = 'Debug',
				icon = {
					icon = "",
					hl = "",
					color = "blue"
				}
			},
			{
				'<F11>',
				function() dap.step_into() end,
				desc = 'Step into',
				-- group = 'Debug',
				icon = {
					icon = "",
					hl = "",
					color = "blue"
				}
			}
			-- {
			-- 	'<S-F11>',
			-- 	function() dap.step_out() end,
			-- 	desc = 'Step out',
			-- 	-- group = 'Debug',
			-- 	icon = {
			-- 		icon = "",
			-- 		hl = "",
			-- 		color = "blue"
			-- 	}
			-- }
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

					local path = vim.fn.getcwd() .. '/build/bin/';

					if (fh.PathExists(path)) then
						return vim.fn.input('Name of executable: ', path, 'file');
					end

					dap.repl.open();

					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
		};
	end
}

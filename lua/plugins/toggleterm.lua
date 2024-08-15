return { 'akinsho/toggleterm.nvim',
	version = "*",
	config = function()
		local tt = require("toggleterm");

		function PercentageToScreenSize(percentage, isColumn)
			if (isColumn == true) then
				return math.floor(vim.api.nvim_get_option("lines") * percentage / 100)
			else
				return math.floor(vim.api.nvim_get_option("columns") * percentage / 100)
			end
		end

		tt.setup({
			float_opts = {
				border = 'curved',
				title_pos = 'center'
			},
			winbar = {
				enabled = true,
				name_formatter = function(term)
					return term.name;
				end
			}
		});

		local wk = require("which-key");

		wk.add({
			{
				'<leader>t',
				group = "terminal",
				icon = {
					icon = "",
					hl = "",
					color = "blue"
				},
				{
					{
						'<Leader>tf',
						"<cmd>ToggleTerm direction=float<cr>",
						desc = "Open terminal floating.",
					},
					{
						'<Leader>tn',
						function()
							local size = PercentageToScreenSize(100 / 3, false);

							vim.cmd("ToggleTerm direction=vertical size=" .. size);
						end,
						desc = "Open terminal vertical.",
					},
					{
						'<Leader>tv',
						function()
							local size = PercentageToScreenSize(100 / 3, true);

							vim.cmd("ToggleTerm direction=horizontal size=" .. size);
						end,
						desc = "Open terminal horizontal.",
					},
					{
						'<Leader>tt',
						"<cmd>ToggleTerm direction=tab<cr>",
						desc = "Open terminal tabbed.",
					}
				}
			},{
				"<leader><leader>t",
				function()
					local size = PercentageToScreenSize(100 / 3, true);

					vim.cmd("ToggleTerm direction=horizontal size=" .. size);
				end,
				desc = "Open terminal horizontal.",
			}
		});

		-- function _G.set_terminal_keymaps()
		-- 	local opts = { buffer = 0 };
		--
		-- 	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts);
		-- 	vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts);
		-- 	vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts);
		-- 	vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts);
		-- 	vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts);
		-- 	vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts);
		-- 	vim.keymap.set('t', '<C-w>', '<cmd>ToggleTerm<cr>', opts);
		-- end

		local opts = { noremap = true, silent = true };

		vim.keymap.set('t', '<c-n>', [[<C-\><C-n>]], opts);
		-- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts);
		vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts);
		vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts);
		vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts);
		vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts);
		vim.keymap.set('t', '<C-q>', [[<C-\><C-n><C-w>q]], opts);

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		--vim.cmd('autocmd! TermOpen term://*toggleterm#*');
	end
}

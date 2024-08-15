return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		local wk = require("which-key");

		local mainMappings = {
			{
				"<leader>m",
				"<cmd>Mason<cr>",
				group = "Mason",
				icon = {
					icon = "󰟾",
					hl = "",
					color = "orange"
				}
			},
			{
				"<leader>Z",
				"<cmd>Lazy<cr>",
				group = "Lazy",
				icon = {
					icon = "",
					hl = "",
					color = "blue"
				}
			},
			{
				"<leader>w",
				"<cmd>w<cr>",
				desc = "Save current buffer",
				icon = {
					icon = "󰉉",
					hl = "",
					color = "green"
				}
			},
			--    {
			-- "<leader>k",
			-- "<C-w>q",
			-- desc = "Close current buffer",
			-- icon = {
			--     icon = "󰅙",
			--     hl = "",
			--     color = "red"
			-- }
			--    },
			{
				"<leader>K",
				"<C-w>q",
				desc = "Force close current buffer",
				icon = {
					icon = "󰅙",
					hl = "",
					color = "red"
				}
			},
		};

		local telescopeMappings = {
			{
				"<leader>f",
				group = "Find Telescope",
				icon = {
					icon = "󰭎",
					hl = "",
					color = "yellow"
				},
				{
					{
						"<leader>ff",
						icon = {
							icon = "󰥨",
							hl = "",
							color = "blue"
						},
					},
					{
						"<leader>fF",
						icon = {
							icon = "󰱼",
							hl = "",
							color = "azure"
						},
					},
					{
						"<leader>fg",
						icon = {
							icon = "",
							hl = "",
							color = "red"
						},
					},
					{
						"<leader>fb",
						icon = {
							icon = "",
							hl = "",
							color = "yellow"
						},
					},
					{
						"<leader>fh",
						icon = {
							icon = "",
							hl = "",
							color = "green"
						},
					},
					{
						"<leader>fo",
						icon = {
							icon = "",
							hl = "",
							color = "cyan"
						},
					},
				},
			},
		};

		local exploreMappings = {
			{
				"<leader>%",
				"<cmd>cd %:p:h<cr>",
				desc = "cd to current file directory.",
				icon = {
					icon = "",
					hl = "",
					color = "green"
				}
			},
			{
				"<leader><leader>e",
				"<cmd>lua MiniFiles.open()<cr>",
				desc = "Open explorer",
				icon = {
					icon = "󰉍",
					hl = "",
					color = "blue"
				}
			},
			{
				"<leader><leader>c",
				"<cmd>lua MiniFiles.open('~/.config/nvim')<cr>",
				desc = "Config Directory",
				icon = {
					icon = "󱧼",
					hl = "",
					color = "blue"
				},
			},
		};

		local codeActions = {
			{
				"<C-Space>",
				function()
					vim.lsp.buf.code_action();
				end,
				desc = "Code action"
			},
			{
				"<Leader><leader>f",
				function()
					vim.lsp.buf.format();
				end,
				desc = "Format code"
			},
		};

		local helpMappings = { "<leader>?", "<cmd>help<cr>", desc = "help" };

		local utilMappings = {
			"<leader>nh",
			"<cmd>nohl<cr>",
			desc = "Remove the search highlighting.",
			icon = {
				icon = "",
				hl = "",
				color = "purple"
			},
			{ '<c-a-l>', [[<C-w>>]], desc = "Increase window width." },
			{ '<c-a-h>', [[<C-w><]], desc = "Decrease window width." },
			{ '<c-a-k>', [[<C-w>+]], desc = "Increase window height." },
			{ '<c-a-j>', [[<C-w>-]], desc = "Decrease window height." },
			{
				"<leader>=",
				"<C-w>=",
				desc = "Equally space the window."
			},
			{
				"<leader>|",
				"<C-w>|",
				desc = "Fully space the window horizontally."
			},
			{
				"<leader>_",
				"<C-w>_",
				desc = "Fully space the window vertically."
			},
			{
				"<leader><leader>d",
				"<cmd>diffthis<cr>",
				desc = "Select the current file for diff comparison.",
				icon = {
					icon = "",
					hl = "",
					color = "green"
				},
			},
			{
				"<leader><leader>D",
				"<cmd>diffoff<cr>",
				desc = "Select the current file for diff comparison.",
				icon = {
					icon = "",
					hl = "",
					color = "green"
				},
			},
			{
				"<leader><leader>v",
				"<C-w>v",
				desc = "Split the screen horizontally.",
				icon = {
					icon = "",
					hl = "",
					color = "yellow"
				},
			},
			{
				"<leader><leader>n",
				"<C-w>n",
				desc = "Split the screen vertically.",
				icon = {
					icon = "",
					hl = "",
					color = "red"
				},
			},
		}

		local lspMappings = {
			{
				"<leader>l",
				group = "LSP actions",
				icon = {
					icon = "",
					hl = "",
					color = "blue"
				},
				{
					"<leader>lR",
					"<cmd>lua vim.lsp.buf.references()<cr>",
					desc = "Show all symbol references.",
					icon = {
						icon = "",
						hl = "",
						color = "blue"
					},
				},
				{
					"<leader>lr",
					"<cmd>lua vim.lsp.buf.rename()<cr>",
					desc = "Rename the current symbol.",
					icon = {
						icon = "󰑕",
						hl = "",
						color = "green"
					},
				{
					"<leader>ld",
					"<cmd>lua vim.lsp.buf.definition()<cr>",
					desc = "Jump to the definition of the symbol.",
					icon = {
						icon = "󰑕",
						hl = "",
						color = "green"
					},
				},
				},
			}
		};

		wk.add(exploreMappings);
		wk.add(codeActions);
		wk.add(telescopeMappings);
		wk.add(mainMappings);
		wk.add(utilMappings);
		wk.add(lspMappings);
	end,
	dependencies = {
		"echasnovski/mini.icons",
		"nvim-tree/nvim-web-devicons"
	},
}

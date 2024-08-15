return {
	'stevearc/overseer.nvim',
	dependencies = {
		"folke/which-key.nvim"
	},
	opts = {},
	config = function()
		local ovs = require("overseer");
		local wk = require("which-key");

		ovs.setup({
			templates = { "build.cmake" }
		});

		wk.add({
			{
				"<leader><leader>o",
				"<cmd>OverseerRun<cr>",
				desc = "Run overseer",
				icon = {
					icon = "󰈈",
					hl = "",
					color = "red"
				}
			},
			{
				"<leader>o",
				"<cmd>OverseerToggle<cr>",
				desc = "Run overseer",
				icon = {
					icon = "󱝕",
					hl = "",
					color = "green"
				}
			},
		});
	end
}

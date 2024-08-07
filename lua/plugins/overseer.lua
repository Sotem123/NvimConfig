return {
    'stevearc/overseer.nvim',
    dependencies = {
	"folke/which-key.nvim"
    },
    opts = {},
    config = function ()

	local ovs = require("overseer");
	local wk = require("which-key");

	ovs.setup({
	    templates = { "builtin", "user.cpp_build" },
	});

	wk.add({
	    {
		"<leader>o",
		"<cmd>OverseerRun<cr>",
		desc = "Run overseer",
		icon = {
		    icon = "󰈈",
		    hl = "",
		    color = "red"
		}
	    },
	});
    end
}

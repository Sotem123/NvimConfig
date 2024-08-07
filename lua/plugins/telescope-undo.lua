return {
	"debugloop/telescope-undo.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
	},
	keys = {
		{
			"<leader>fu",
			"<cmd>lua require('telescope').extensions.undo.undo()<Cr>",
			desc = "Undo history"
		},
		{
			"<leader>fU",
			"<cmd>lua require('telescope').extensions.undo.undo({ side_by_side = true })<Cr>",
			desc = "Undo history"
		}
	},
	opts = {
		-- extensions = { -- telescope-undo.nvim config, see below
		-- 	undo = {
		-- 		side_by_side = true,
		-- 		layout_strategy = "vertical",
		-- 		layout_config = {
		-- 			preview_height = 0.8,
		-- 		},
		-- 	},
		-- },
	},
	config = function(_, opts)
		local ts = require("telescope");

		-- ts.setup(opts);

		ts.setup({
			extensions = {
				undo = {
					side_by_side = true,
					layout_strategy = "vertical",
					layout_config = {
						preview_height = 0.8,
					},
					mappings = {
						i = {
							["<cr>"] = require("telescope-undo.actions").yank_additions,
							["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
							["<C-cr>"] = require("telescope-undo.actions").restore,
							-- alternative defaults, for users whose terminals do questionable things with modified <cr>
							["<C-y>"] = require("telescope-undo.actions").yank_deletions,
							["<C-r>"] = require("telescope-undo.actions").restore,
						},
						n = {
							["y"] = require("telescope-undo.actions").yank_additions,
							["Y"] = require("telescope-undo.actions").yank_deletions,
							["u"] = require("telescope-undo.actions").restore,
						},
					},
				},
			},
		});

		ts.load_extension("undo");
	end
}

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

		-- require("overseer").register_template({
		-- 	name = "Git checkout",
		-- 	params = function()
		-- 		local stdout = vim.system({ "git", "branch", "--format=%(refname:short)" }):wait().stdout
		-- 		local branches = vim.split(stdout, "\n", { trimempty = true })
		-- 		return {
		-- 			denaam = {
		-- 				type = "number",
		-- 				name = "Prachtige naam",
		-- 				desc = "Heel gedetailleerd enzo",
		-- 				order = 2,
		-- 				validate = function(value)
		-- 					return value == 5
		-- 				end,
		-- 				optional = false
		-- 			},
		-- 			lijst = {
		-- 				type = "list",
		-- 				subtype = {
		-- 					type = "number"
		-- 				},
		-- 				name = "Prachtige lijst",
		-- 				desc = "Heel gedetailleerd lijst enzo",
		-- 				order = 1,
		-- 				validate = function(value)
		-- 					return value == 5
		-- 				end,
		-- 				optional = false
		-- 			}
		-- 		}
		-- 	end,
		-- 	builder = function(params)
		-- 		return {
		-- 			cmd = { "git", "checkout", params.branch },
		-- 		}
		-- 	end,
		-- });

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

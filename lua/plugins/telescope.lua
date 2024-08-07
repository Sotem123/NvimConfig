return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
	"nvim-lua/plenary.nvim",
	"nvim-treesitter/nvim-treesitter",
    },
    config = function()

	local builtin = require("telescope.builtin");

	vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files." });
	vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Recentenly opened files."});
	vim.keymap.set('n', '<leader>fF', builtin.live_grep, { desc = "Find inside files." });
	vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "Find git files." });
	vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find in buffer." });
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find in help tags."});
	vim.keymap.set('n', '<leader>fo', builtin.vim_options, { desc = "Find in options."});
	vim.keymap.set('n', '<leader>fc', builtin.command_history, { desc = "Recentenly used commands."});
    end
}

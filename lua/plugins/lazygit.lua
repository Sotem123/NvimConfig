return {
    "kdheepak/lazygit.nvim",
    cmd = {
	"LazyGit",
	"LazyGitConfig",
	"LazyGitCurrentFile",
	"LazyGitFilter",
	"LazyGitFilterCurrentFile",
    },
    dependencies = {
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
    },
    keys = {
	{ "<leader><leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
    config = function()

	require("telescope").load_extension("lazygit");
    end
};

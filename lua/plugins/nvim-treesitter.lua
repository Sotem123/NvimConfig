return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
    
	local configs = require("nvim-treesitter.configs");

	-- Make treesitter define folds.
	vim.wo.foldmethod = 'expr'
	vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

	configs.setup({
	    ensure_installed = {
		"asm",
		"c",
		"cpp",
		"c_sharp",
		"scss",
		"css",
		"git_config",
		"git_rebase",
		"gitcommit",
		"gitignore",
		"graphql",
		"regex",
		"angular",
		"csv",
		"cmake",
		"svelte",
		"typescript",
		"query",
		"sql",
		"python",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"javascript",
		"java",
		"json",
		"xml",
		"html",
		"http",
	    },
	    sync_install = false,
	    highlight = { enable = true },
	    indent = { enable = true }
	});
    end
};

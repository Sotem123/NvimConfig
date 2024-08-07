return {
    -- the colorscheme should be available when starting Neovim
    {
	"folke/tokyonight.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000--, -- make sure to load this before all the other start plugins
	--config = function()
	--    -- load the colorscheme here
	--    vim.cmd.colorscheme('tokyonight')
	--end,
    },
    {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000
    },
    {
	"morhetz/gruvbox",
	priority = 1000,
	config = function()
	    -- load the colorscheme here
	    vim.cmd.colorscheme('gruvbox')
	end
    },
    {
	"vague2k/vague.nvim",
	lazy = false,
	priority = 1000
    },
    {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000
    },
    {
	"sainnhe/everforest",
	lazy = false,
	priority = 1000
    },
    {
	"sainnhe/edge",
	lazy = false,
	priority = 1000
    },
    {
	"sainnhe/sonokai",
	lazy = false,
	priority = 1000
    },
    {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000
    },
}

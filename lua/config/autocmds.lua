local foldGroup = vim.api.nvim_create_augroup('foldGroup', { clear = true });

vim.api.nvim_create_autocmd({
	"BufWinEnter"
}, {
	group = foldGroup,
	pattern = "*",
	command = "mkview"
});

vim.api.nvim_create_autocmd({
	"BufWinLeave"
}, {
	group = foldGroup,
	pattern = "*",
	command = "silent! loadview"
});

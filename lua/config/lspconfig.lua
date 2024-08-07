local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp", "h" },
	-- on_attach = function(client, buffer)
	--
	-- end,
	settings = {
		clangd = {
			fallbackFlags = { "-std=c++17" }
		},
	},
});

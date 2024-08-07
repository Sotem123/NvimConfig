return {
    "hrsh7th/nvim-cmp",
    dependencies = {
	"hrsh7th/cmp-buffer",	-- Autocomplete for the buffer.
	"hrsh7th/cmp-cmdline",	-- Completions in command mode en search based on current buffer.
	"hrsh7th/cmp-path",	-- Completion paths.
	"hrsh7th/cmp-calc",	-- Evaluating mathmetical expressions.
	"hrsh7th/cmp-nvim-lsp-document-symbol",	-- Use / and @ in order to autocomplete based on symbols in the current buffer.
	"hrsh7th/cmp-nvim-lsp-signature-help",	-- Provided autocomplete for function signatures.
	"hrsh7th/cmp-vsnip",	-- Snippet engines
	"hrsh7th/vim-vsnip",	-- Snippet engines
	"hrsh7th/cmp-nvim-lsp",	-- LSP support
	"hrsh7th/cmp-nvim-lua",	-- This source will complete neovim's Lua runtime API such vim.lsp.*
	"rafamadriz/friendly-snippets",	-- Collection of community-based snippets
    },
    config = function()

	local cmp = require("cmp");

	-- Dingen om nog uit te zoeken.
	-- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
	-- Ik heb nog niet gezien dat ik function auto-complete heb.

	cmp.setup({
	    snippet = {
		expand = function(args)
		    vim.fn["vsnip#anonymous"](args.body);
		end,
	    },
	    window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	    },
	    mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-h>'] = cmp.mapping.abort(),
		--['<leader><leader>'] = cmp.mapping.confirm({
		['<Cr>'] = cmp.mapping.confirm({
		    select = true
		}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items
		['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
		['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" })
	    }),
	    sources = cmp.config.sources({
		{ name = 'cmp_nvim_lsp_signature_help' },
		{ name = 'nvim_lsp' },
		--{ name = 'vsnip' },
		{ name = "nvim_lua"},
	    }, {
		{ name = 'path' },
		{ name = 'buffer' },
	    }),
	});

	cmp.setup.cmdline({ '/', '?' }, {
	    mapping = cmp.mapping.preset.cmdline(),
	    sources = cmp.config.sources({
		{ name = 'nvim_lsp_document_symbol' },
	    }, {
		{ name = 'buffer' }
	    })
	});

	-- `:` cmdline setup.
	cmp.setup.cmdline(':', {
	    mapping = cmp.mapping.preset.cmdline(),
	    sources = cmp.config.sources({
		{ name = 'calc' },
		{ name = "nvim_lua"},
	    },{
		{ name = 'path' }
	    }, {
		    {
			name = 'cmdline',
			-- option = {
			--     ignore_cmds = { 'Man', '!' },
			-- },
		    }
	    }),
	    matching = { disallow_symbol_nonprefix_matching = false }
	});

	-- The nvim-cmp almost supports LSP's capabilities so you should advertise it to LSP servers.
	local capabilities = require('cmp_nvim_lsp').default_capabilities();

	-- Setup lspconfig.
	local lsp = require('lspconfig')

	lsp['lua_ls'].setup({
	    capabilities = capabilities
	});

	lsp['clangd'].setup({
	    capabilities = capabilities
	});
    end
}

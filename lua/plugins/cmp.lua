-- lua/plugins/cmp.lua
return {
	"hrsh7th/nvim-cmp",
	-- Load nvim-cmp on InsertEnter, which is when completion is most needed.
	event = "InsertEnter",
	-- All dependencies will be lazy-loaded with nvim-cmp.
	dependencies = {
		-- Source for LSP completions.
		"hrsh7th/cmp-nvim-lsp",
		-- Source for buffer text completions.
		"hrsh7th/cmp-buffer",
		-- Source for filesystem path completions.
		"hrsh7th/cmp-path",
		-- Snippet engine.
		"L3MON4D3/LuaSnip",
		-- Source for snippet completions.
		"saadparwaiz1/cmp_luasnip",
		-- Optional: A collection of useful snippets.
		"rafamadriz/friendly-snippets",
	},
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        }),
      })
    end,
}

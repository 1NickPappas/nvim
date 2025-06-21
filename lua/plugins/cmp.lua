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
		-- We will place the nvim-cmp setup logic here.
	end,
}

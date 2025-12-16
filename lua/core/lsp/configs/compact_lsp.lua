-- ~/.config/nvim_test/lua/core/lsp/configs/compact_lsp.lua
--
-- Configuration for compact-lsp (Midnight Compact language server)
-- This is a custom LSP, not installed via Mason.

return {
	-- Path to the compact-lsp binary
	cmd = { vim.fn.expand("~/Documents/midnight/lsp/compact-lsp/target/release/compact-lsp") },

	-- File types this LSP should attach to
	filetypes = { "compact" },

	-- Root directory detection
	-- The LSP will use this to determine the project root
	root_markers = { ".git", "compact.toml", "package.json" },

	-- LSP-specific settings (passed to the server)
	settings = {
		compact = {
			-- Future settings can go here
		},
	},
}

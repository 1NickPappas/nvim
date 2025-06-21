-- lua/plugins/lsp.lua
return {
	"neovim/nvim-lspconfig",
	-- The 'event' option is crucial for lazy-loading. It ensures that nvim-lspconfig
	-- is loaded only when a file is opened, improving startup time.
	event = { "BufReadPre", "BufNewFile" },
	-- Dependencies are plugins that must be loaded before this one.
	-- We need mason-lspconfig to be available to automatically set up servers.
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
	},
	-- The config function is executed when the plugin is loaded.
	config = function()
		-- Require our custom LSP configuration module.
		-- This keeps the plugin specification file clean and separates concerns.
		require("core.lsp")
	end,
}

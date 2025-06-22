-- lua/plugins/mason.lua
return {
	-- Mason: The core package manager for Neovim.
	-- It handles the installation and management of LSP servers, formatters, linters, etc.
	{
		"mason-org/mason.nvim",
		-- opts = {} calls the setup function with default settings.
		opts = {},
	},

	-- mason-lspconfig: The bridge between Mason and nvim-lspconfig.
	-- This plugin automates the setup of LSP servers installed via Mason.
	{
		"mason-org/mason-lspconfig.nvim",
		-- This plugin must be loaded after mason.nvim.
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			-- A list of servers to automatically install if they're not already installed.
			-- mason-lspconfig will translate these server names to the correct Mason package names.
			ensure_installed = {
				"lua_ls",
				"pyright",
				"rust_analyzer",
				--"tsserver",
				"html",
				"cssls",
				"gopls", -- Example: for Go
				"marksman", -- Example: for Markdown
			},
			-- This setting ensures that `vim.lsp.enable()` is called for all installed servers,
			-- activating them for use with nvim-lspconfig. This is the key feature of the plugin
			-- in the modern Neovim 0.11+ ecosystem.
			automatic_enable = true,
		},
	},
}

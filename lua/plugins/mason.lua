-- lua/plugins/mason.lua
-- return {
-- 	-- Mason: The core package manager for Neovim.
-- 	-- It handles the installation and management of LSP servers, formatters, linters, etc.
-- 	{
-- 		"mason-org/mason.nvim",
-- 		-- opts = {} calls the setup function with default settings.
-- 		opts = {},
-- 	},
--
-- 	-- mason-lspconfig: The bridge between Mason and nvim-lspconfig.
-- 	-- This plugin automates the setup of LSP servers installed via Mason.
-- 	{
-- 		"mason-org/mason-lspconfig.nvim",
-- 		-- This plugin must be loaded after mason.nvim.
-- 		dependencies = { "mason-org/mason.nvim" },
-- 		opts = {
-- 			-- A list of servers to automatically install if they're not already installed.
-- 			-- mason-lspconfig will translate these server names to the correct Mason package names.
-- 			ensure_installed = {
-- 				"lua_ls",
-- 				"pyright",
-- 				"rust_analyzer",
-- 				--"tsserver",
-- 				"html",
-- 				"cssls",
-- 				"gopls", -- Example: for Go
-- 				"marksman", -- Example: for Markdown
-- 				"hls",
-- 			},
-- 			-- This setting ensures that `vim.lsp.enable()` is called for all installed servers,
-- 			-- activating them for use with nvim-lspconfig. This is the key feature of the plugin
-- 			-- in the modern Neovim 0.11+ ecosystem.
-- 			automatic_enable = true,
-- 		},
-- 	},
-- }
return {
	"mason-org/mason.nvim",
	-- The 'build' option is a hook that runs after the plugin is installed or updated.
	-- :MasonUpdate will update the package registry, ensuring you have the latest
	-- versions of all tools available.
	build = ":MasonUpdate",
	-- Dependencies are plugins that must be loaded before this one.
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	-- The config function is executed when the plugin is loaded.
	config = function()
		-- Initialize mason. You can customize the UI here if desired.
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- Initialize mason-lspconfig.
		require("mason-lspconfig").setup({
			-- This is the key part of the integration. It ensures that Mason will
			-- automatically install the LSPs we specify below.
			ensure_installed = {
				"rust_analyzer",
				"ts_ls",
				"lua_ls", -- Keep the existing Lua LSP
			},
			-- This setting ensures that mason-lspconfig will automatically call the setup function
			-- for each installed server, passing in the default configurations from nvim-lspconfig.
			automatic_installation = true,
		})

		-- Additionally, we will use Mason to manage our formatters and linters.
		-- This is separate from mason-lspconfig, as these are not LSPs.
		-- We use a handy utility plugin to manage this declaratively.
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- Rust tools
				"rustfmt",
				-- TypeScript/JavaScript tools
				"prettier", -- Formatter
				"eslint_d", -- Linter (daemonized for performance)
				-- Existing tools
				"stylua", -- Lua formatter
			},
		})
	end,
}

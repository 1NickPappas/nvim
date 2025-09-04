-- ~/.config/nvim/lua/plugins/syntax.lua

-- return {
-- 	-- Syntax Highlighting for the Move language
-- 	{
-- 		"yanganto/move.vim",
-- 		branch = "sui-move",
-- 	},
--
-- 	-- nvim-treesitter for better syntax highlighting
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		build = ":TSUpdate",
-- 		config = function()
-- 			require("nvim-treesitter.configs").setup({
-- 				ensure_installed = { "rust", "lua" },
-- 				highlight = {
-- 					enable = true,
-- 				},
-- 				indent = { enable = true },
-- 			})
-- 		end,
-- 	},
--
-- 	-- You can add other syntax plugins here in the future
-- 	-- For example:
-- 	-- { "jason-williams/move.nvim", ft = { "move" } }
-- }
return {
	-- Syntax Highlighting for the Move language
	{
		"yanganto/move.vim",
		branch = "sui-move",
	},

	-- nvim-treesitter for better syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				-- Update this table to include the new languages.
				ensure_installed = {
					"rust",
					"lua",
					"typescript",
					"javascript",
					"tsx", -- Essential for React/JSX support
					"json",
					"toml", -- Useful for Rust's Cargo.toml
				},
				highlight = {
					enable = true,
				},
				indent = { enable = true },
			})
		end,
	},
}

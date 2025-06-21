-- ~/.config/nvim/lua/plugins/syntax.lua

return {
	-- Syntax Highlighting for the Move language
	{
		"tzakian/move.vim",
		ft = { "move" }, -- Lazy load on the "move" filetype
	},

	-- You can add other syntax plugins here in the future
	-- For example:
	-- { "jason-williams/move.nvim", ft = { "move" } }
}

-- Compact language support (Midnight smart contracts)
return {
	-- Published version from GitHub
	{
		"1NickPappas/compact.vim",
		ft = "compact",
	},

	-- Local development version (uncomment for testing)
	-- {
	-- 	dir = vim.fn.expand("~/Documents/midnight/lsp/compact.vim"),
	-- 	ft = "compact",
	-- 	config = function()
	-- 		-- Optional: configure tree-sitter integration
	-- 		local ok, compact = pcall(require, "compact")
	-- 		if ok then
	-- 			compact.setup({
	-- 				-- Path to local tree-sitter grammar (optional)
	-- 				grammar_path = vim.fn.expand("~/Documents/midnight/lsp/compact-tree-sitter"),
	-- 			})
	-- 		end
	-- 	end,
	-- },
}

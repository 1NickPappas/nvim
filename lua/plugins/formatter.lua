return {
	-- Replace with the actual path to your plugin
	dir = "/Users/nick.pappas/Documents/real_personal_projects/formatter-move.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", -- only if your plugin depends on it
		"nvimtools/none-ls.nvim", -- optional/recommended, same as the example
	},
	-- Set `lazy = false` if you want it loaded immediately
	--lazy = false,
	-- Optional: dependencies or config
	config = function()
		require("formatter-move").setup({
			-- Your custom options here
			--format_command = 'npx prettier --plugin-search-dir "$(npm root -g)" --plugin=@mysten/prettier-plugin-move --write',
			format_on_save = true,
		})
		-- setup none-ls for formatting
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.rustfmt,
				null_ls.builtins.formatting.stylua,
			},
		})
	end,
}
-- return {
--   "1NickPappas/formatter-move.nvim",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvimtools/none-ls.nvim", -- Recommended
--   },
--   config = function()
--     require("formatter-move").setup({
--       format_on_save = true,
--     })
--   end,
-- }

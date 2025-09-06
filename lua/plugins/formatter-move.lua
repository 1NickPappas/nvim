return {
	"1NickPappas/formatter-move.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("formatter-move").setup({
			format_on_save = true,
		})
	end,
}

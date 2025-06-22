-- ~/.config/nvim/lua/plugins/telescope.lua
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },

	-- The config function is the best place to set up the plugin and define keymaps
	config = function()
		-- You can call the setup function to customize Telescope,
		-- but it also works with default settings.
		require("telescope").setup({
			-- You can put any configuration options here.
			-- For example, to set a specific theme:
			-- defaults = {
			--   layout_strategy = "horizontal",
			--   layout_config = {
			--     horizontal = {
			--       prompt_position = "top",
			--       preview_width = 0.55,
			--     },
			--   },
			-- },
		})

		-- This line is a shortcut to avoid writing "require('telescope.builtin')" repeatedly.
		local builtin = require("telescope.builtin")

		-- Set keymaps
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
	end,
}

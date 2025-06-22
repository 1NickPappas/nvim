return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		-- picker = { enabled = true }, -- Prefer telescope
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		-- scroll = { enabled = true }, -- Smoother scroll prefer disable
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		{
			"<leader>gg",
			function()
				require("snacks.lazygit").open()
			end,
			desc = "Open LazyGit",
		},
	    -- For the Explorer module
	    {
	    	"<leader>e",
	    	function()
	    		require("snacks").explorer()
	    	end,
	    	desc = "Explorer (cwd)",
	    },
	    {
	    	"<leader>E",
	    	function()
	    		require("snacks").explorer({ cwd = vim.fn.stdpath("config") })
	    	end,
	    	desc = "Explorer (config)",
	    },
	},
}

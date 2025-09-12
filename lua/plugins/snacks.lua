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
		dashboard = { 
			enabled = true,
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
		explorer = { enabled = true },
		image = { enabled = true }, -- Enable since all tools are available
		indent = { enabled = true },
		input = { enabled = true },
		picker = { 
			enabled = true,  -- Enable as secondary picker
			win = { input = { keys = { ["<C-c>"] = "close" } } }
		},
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
	    -- Snacks picker bindings (alternative to telescope)
	    {
	    	"<leader>sf",
	    	function()
	    		require("snacks").picker.files()
	    	end,
	    	desc = "Find Files (Snacks)",
	    },
	    {
	    	"<leader>sg",
	    	function()
	    		require("snacks").picker.grep()
	    	end,
	    	desc = "Live Grep (Snacks)",
	    },
	},
}

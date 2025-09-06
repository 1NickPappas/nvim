return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		-- Key: <leader>a
		-- Action: Adds the current file to the harpoon list.
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers").new({}, {
				prompt_title = "Harpoon",
				finder = require("telescope.finders").new_table({
					results = file_paths,
				}),
				previewer = conf.file_previewer({}),
				sorter = conf.generic_sorter({}),
			}):find()
		end

		-- Key: Ctrl + e
		-- Action: Toggles the harpoon quick menu using Telescope.
		vim.keymap.set("n", "<C-e>", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })

		-- Key: Ctrl + h
		-- Action: Navigates to the 1st file in the harpoon list.
		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end)
		-- Key: Ctrl + t
		-- Action: Navigates to the 2nd file in the harpoon list.
		vim.keymap.set("n", "<C-t>", function()
			harpoon:list():select(2)
		end)
		-- Key: Ctrl + n
		-- Action: Navigates to the 3rd file in the harpoon list.
		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():select(3)
		end)
		-- Key: Ctrl + s
		-- Action: Navigates to the 4th file in the harpoon list.
		vim.keymap.set("n", "<C-s>", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		-- Key: Ctrl + Shift + P
		-- Action: Navigates to the previous file in the harpoon list.
		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end)
		-- Key: Ctrl + Shift + N
		-- Action: Navigates to the next file in the harpoon list.
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end)
	end,
}

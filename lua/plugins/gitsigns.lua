return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = true,
			numhl = false,
			linehl = false,
			word_diff = false,
			watch_gitdir = {
				follow_files = true,
			},
			auto_attach = true,
			attach_to_untracked = false,
			current_line_blame = false,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol",
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
			},
			preview_config = {
				border = "rounded",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")
				local opts = { buffer = bufnr, noremap = true, silent = true }

				-- Hunk navigation
				vim.keymap.set("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, opts)

				vim.keymap.set("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, opts)

				-- Hunk actions
				vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, opts)
				vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, opts)
				vim.keymap.set("v", "<leader>hs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, opts)
				vim.keymap.set("v", "<leader>hr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, opts)
				vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, opts)
				vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, opts)
				vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, opts)

				-- Buffer actions
				vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, opts)
				vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, opts)
				vim.keymap.set("n", "<leader>hb", function()
					gitsigns.blame_line({ full = true })
				end, opts)
				vim.keymap.set("n", "<leader>hB", gitsigns.toggle_current_line_blame, opts)

				-- Text object for hunks
				vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", opts)
			end,
		})
	end,
}
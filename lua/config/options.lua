-- lua/config/options.lua

-- For a more comprehensive list of options, see `:help option-list`

--]
-- See `:help vim.o` and `:help vim.opt` for more options.

-- Your specific settings for indentation and text formatting
vim.opt.colorcolumn = "80" -- Show a vertical line at 80 columns
-- Tab and indentation settings
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 2 -- Number of spaces a tab looks like
vim.opt.softtabstop = 2 -- Number of spaces to insert for a tab
vim.opt.shiftwidth = 2 -- Number of spaces to use for auto-indent

-- vim.opt.tabstop = 4            -- A TAB character equals 4 spaces
-- vim.opt.softtabstop = 4        -- Number of spaces for a TAB in insert mode
-- vim.opt.shiftwidth = 4         -- Number of spaces for each step of (auto)indent
-- vim.opt.expandtab = true       -- Use spaces instead of TAB characters

-- General editor options
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.mouse = "a" -- Enable mouse support in all modes
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.breakindent = true -- Maintain indentation when wrapping lines
vim.opt.undofile = true -- Persist undo history
vim.opt.ignorecase = true -- Case-insensitive searching
vim.opt.smartcase = true -- But case-sensitive if the search term contains uppercase letters
vim.opt.updatetime = 250 -- Time in ms to wait for completing a mapped sequence
vim.opt.timeoutlen = 300 -- Time in ms to wait for a mapped sequence to complete
vim.opt.splitright = true -- When splitting vertically, the new window appears on the right
vim.opt.splitbelow = true -- When splitting horizontally, the new window appears below
vim.opt.list = true -- Show invisible characters
vim.opt.listchars:append("tab:» ") -- Configure how tabs are displayed
vim.opt.inccommand = "split" -- Show substitution results live
vim.opt.cursorline = true -- Highlight the current line

-- Configure how diagnostics are displayed
-- This enables virtual text, which shows error messages at the end of the line
vim.diagnostic.config({
	virtual_text = true,
})

-- Disable unused providers to reduce warnings
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

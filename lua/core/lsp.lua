-- lua/core/lsp.lua
local M = {}

-- First, get the capabilities object from cmp-nvim-lsp.
-- This is crucial for enabling advanced completion features.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- The on_attach function: our gateway to LSP features.
-- This function is called for every buffer that gets an LSP client attached.
local function on_attach(client, bufnr)
	-- Enable completion triggered by <C-x><C-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Keymaps for LSP functionality.
	-- These are buffer-local, so they only apply in buffers with an active LSP.
	local opts = { buffer = bufnr, noremap = true, silent = true }

	-- Basic LSP navigation
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

	-- Enhanced diagnostics navigation
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	
	-- Enhanced error navigation with fallback
	vim.keymap.set("n", "[e", function()
		local diagnostics = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		if #diagnostics == 0 then
			vim.notify("No errors in buffer", vim.log.levels.INFO)
			return
		end
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end, opts)
	
	vim.keymap.set("n", "]e", function()
		local diagnostics = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		if #diagnostics == 0 then
			vim.notify("No errors in buffer", vim.log.levels.INFO)
			return
		end
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	end, opts)
	
	vim.keymap.set("n", "[w", function()
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
	end, opts)
	vim.keymap.set("n", "]w", function()
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
	end, opts)
	vim.keymap.set("n", "[h", function()
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.HINT })
	end, opts)
	vim.keymap.set("n", "]h", function()
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.HINT })
	end, opts)

	-- Diagnostics display
	vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
	vim.keymap.set("n", "<leader>lD", vim.diagnostic.setqflist, opts)

	-- Code actions and modifications
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>lf", function()
		vim.lsp.buf.format({ async = true })
	end, opts)
	vim.keymap.set("v", "<leader>lf", function()
		vim.lsp.buf.format({ async = true })
	end, opts)

	-- Workspace management
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)

	-- Document/workspace symbols
	vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, opts)
	vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)

	-- Type definition in float
	vim.keymap.set("n", "<leader>D", function()
		local params = vim.lsp.util.make_position_params()
		vim.lsp.buf_request(0, "textDocument/typeDefinition", params, function(_, result)
			if not result or vim.tbl_isempty(result) then
				vim.notify("No type definition found")
				return
			end
			vim.lsp.util.preview_location(result[1], { border = "rounded" })
		end)
	end, opts)

	-- Rust-specific keymaps
	if client.name == "rust_analyzer" then
		-- Cargo commands
		vim.keymap.set("n", "<leader>rc", ":!cargo check<CR>", opts)
		vim.keymap.set("n", "<leader>rr", ":!cargo run<CR>", opts)
		vim.keymap.set("n", "<leader>rt", ":!cargo test<CR>", opts)
		vim.keymap.set("n", "<leader>rb", ":!cargo build<CR>", opts)
		vim.keymap.set("n", "<leader>rR", ":!cargo run --release<CR>", opts)
		vim.keymap.set("n", "<leader>rB", ":!cargo build --release<CR>", opts)
		
		-- Rust Analyzer specific actions
		vim.keymap.set("n", "<leader>rm", ":RustLsp expandMacro<CR>", opts)
		vim.keymap.set("n", "<leader>re", ":RustLsp explainError<CR>", opts)
		vim.keymap.set("n", "<leader>rd", ":RustLsp renderDiagnostic<CR>", opts)
	end
end

-- Register the global configuration using vim.lsp.config.
-- The '*' means this will apply to all servers.
vim.lsp.config("*", {
	on_attach = on_attach,
	-- This is the crucial handshake. It tells the LSP server that nvim-cmp
	-- is providing the completion UI and supports advanced features.
	capabilities = capabilities,
})

-- Apply per-server configurations.
-- This logic iterates through all servers installed by Mason and applies any
-- corresponding configuration file found in `lua/core/lsp/configs/`.
local servers = require("mason-lspconfig").get_installed_servers()

for _, server_name in ipairs(servers) do
	local server_config_path = "core.lsp.configs." .. server_name
	-- pcall safely attempts to require the module, preventing errors if it doesn't exist.
	local success, server_config = pcall(require, server_config_path)

	if success and server_config then
		-- Ensure our global on_attach is preserved
		server_config.on_attach = on_attach
		server_config.capabilities = capabilities
		-- vim.lsp.config will intelligently merge the server-specific config
		-- with the global defaults we set above.
		vim.lsp.config(server_name, server_config)
	end
	
	-- Enable the LSP server
	vim.lsp.enable(server_name)
end

-- Ensure TypeScript LSP is enabled for TS files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	callback = function()
		vim.lsp.enable("ts_ls")
	end,
})

return M

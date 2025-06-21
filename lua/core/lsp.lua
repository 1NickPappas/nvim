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

	-- See :help vim.lsp.buf and :help vim.diagnostic for more info on these functions.
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
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
		-- vim.lsp.config will intelligently merge the server-specific config
		-- with the global defaults we set above.
		vim.lsp.config(server_name, server_config)
	end
end

return M

-- ~/.config/nvim/lua/core/lsp/configs/move_analyzer.lua

-- This file tells lspconfig how to start the "move_analyzer" server.
-- It will use this configuration regardless of how the server was installed.
return {
	-- Point to your manually installed Sui binary
	cmd = { vim.fn.expand("~/.cargo/bin/move-analyzer") },
}

-- lua/core/lsp/configs/lua_ls.lua
return {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false, -- To disable checking third-party libraries.
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

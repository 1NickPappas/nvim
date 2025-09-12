-- This helper function is a best practice for ensuring tsserver uses
-- the project's local version of TypeScript, not a global one.
-- This avoids version mismatches between your editor and your build tools.
local function get_typescript_server_path(root_dir)
	local project_root = require("lspconfig.util").find_node_modules_ancestor(root_dir)
	if project_root then
		local ts_path = project_root .. "/node_modules/typescript/lib/tsserverlibrary.js"
		-- Check if the file actually exists
		local f = io.open(ts_path, "r")
		if f then
			f:close()
			return ts_path
		end
	end
	-- If no local version is found, return nil to use the default (global) one.
	return nil
end

-- Detect if project uses Bun (for potential future use)
-- local function get_js_runtime_config(root_dir)
-- 	local util = require("lspconfig.util")
--
-- 	-- Check for Bun
-- 	if util.path.exists(util.path.join(root_dir, "bun.lockb"))
-- 		or (util.path.exists(util.path.join(root_dir, "package.json")) and
-- 			vim.fn.system("grep -q '\"bun\"' " .. util.path.join(root_dir, "package.json"))) then
-- 		return "bun"
-- 	end
--
-- 	-- Default to Node.js/npm
-- 	return "node"
-- end

return {
	-- The on_new_config function allows us to dynamically modify the server's
	-- configuration right before it starts.
	on_new_config = function(new_config, new_root_dir)
		local tsdk = get_typescript_server_path(new_root_dir)
		if tsdk then
			new_config.init_options = new_config.init_options or {}
			new_config.init_options.tsdk = tsdk
		end
	end,
	-- Don't override the global on_attach - let it use the one from core/lsp.lua
	-- Enhanced TypeScript LSP settings
	settings = (function()
		-- Common settings for all JS/TS variants
		local common_settings = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
			suggest = {
				includeCompletionsForModuleExports = true,
				includeCompletionsForImportStatements = true,
			},
			preferences = {
				includePackageJsonAutoImports = "auto",
				importModuleSpecifier = "shortest",
				quoteStyle = "auto",
			},
		}

		return {
			completions = {
				completeFunctionCalls = true,
			},
			typescript = common_settings,
			javascript = common_settings,
			typescriptreact = common_settings,
			javascriptreact = common_settings,
		}
	end)(),
}

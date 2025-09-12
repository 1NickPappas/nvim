-- Enhanced Rust Analyzer configuration for professional development
return {
	settings = {
		["rust-analyzer"] = {
			-- Cargo configuration
			cargo = {
				allFeatures = true,
				loadOutDirsFromCheck = true,
				buildScripts = {
					enable = true,
				},
			},
			
			-- Clippy linting on save (compatible format)
			checkOnSave = true,
			check = {
				command = "clippy",
				extraArgs = { "--no-deps" },
			},
			
			-- Proc macro support  
			procMacro = {
				enable = true,
				ignored = {
					["async-trait"] = { "async_trait" },
					["napi-derive"] = { "napi" },
					["async-recursion"] = { "async_recursion" },
				},
			},
			
			-- Inlay hints
			inlayHints = {
				bindingModeHints = {
					enable = false,
				},
				chainingHints = {
					enable = true,
				},
				closingBraceHints = {
					enable = true,
					minLines = 25,
				},
				closureReturnTypeHints = {
					enable = "never",
				},
				lifetimeElisionHints = {
					enable = "never",
					useParameterNames = false,
				},
				maxLength = 25,
				parameterHints = {
					enable = true,
				},
				reborrowHints = {
					enable = "never",
				},
				renderColons = true,
				typeHints = {
					enable = true,
					hideClosureInitialization = false,
					hideNamedConstructor = false,
				},
			},
			
			-- Completion settings
			completion = {
				callable = {
					snippets = "fill_arguments",
				},
			},
			
			-- Diagnostics
			diagnostics = {
				enable = true,
				experimental = {
					enable = true,
				},
			},
			
			-- Hover and docs
			hover = {
				actions = {
					enable = true,
				},
				links = {
					enable = true,
				},
			},
			
			-- Workspace settings
			files = {
				watcher = "notify",
			},
			
			-- Lens (code actions in editor)
			lens = {
				enable = true,
				implementations = {
					enable = true,
				},
				references = {
					adt = {
						enable = true,
					},
					enumVariant = {
						enable = true,
					},
					method = {
						enable = true,
					},
					trait = {
						enable = true,
					},
				},
				run = {
					enable = true,
				},
			},
		},
	},
}

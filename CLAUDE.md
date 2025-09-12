# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Neovim Configuration Structure

This is a modern Neovim configuration using Lazy.nvim as the plugin manager. The configuration follows a modular structure:

- **Entry Point**: `init.lua` - Sets leader key, loads options, and bootstraps Lazy.nvim
- **Core Configuration**: `lua/config/` - Contains fundamental editor settings
  - `options.lua` - Editor options (indentation: 2 spaces, line numbers, clipboard integration)
  - `lazy.lua` - Lazy.nvim bootstrap and plugin loading
- **Core Modules**: `lua/core/` - Contains advanced functionality
  - `lsp.lua` - Centralized LSP configuration with global keymaps and auto-configuration
  - `lsp/configs/` - Individual LSP server configurations (lua_ls, rust_analyzer, ts_ls, etc.)
- **Plugins**: `lua/plugins/` - Individual plugin specifications loaded by Lazy.nvim

## LSP Architecture

The LSP setup uses a centralized approach:

1. **Global Configuration**: `lua/core/lsp.lua` defines universal LSP keymaps and capabilities
2. **Auto-discovery**: Automatically applies server-specific configs from `lua/core/lsp/configs/`
3. **Mason Integration**: `lua/plugins/mason.lua` ensures LSP servers and tools are installed
4. **Supported Languages**: Lua, Rust, TypeScript/JavaScript, Haskell, Move

Key LSP keymaps:
- `gd` - Go to definition
- `gr` - Go to references  
- `K` - Hover documentation
- `<leader>ca` - Code actions
- `<leader>rn` - Rename
- `[d`/`]d` - Navigate diagnostics

## Development Tools

### Formatting
- **Tool**: conform.nvim with format-on-save enabled
- **Formatters**: stylua (Lua), rustfmt (Rust), prettier (TS/JS/JSON/YAML/Markdown/HTML/CSS)
- **Timeout**: 500ms with LSP fallback

### Package Management
- **LSP Servers**: Managed by mason-lspconfig.nvim with automatic installation
- **Tools**: Managed by mason-tool-installer.nvim
- **Installed Tools**: rustfmt, prettier, eslint_d, stylua

### Key Plugins
- **telescope.nvim** - Fuzzy finder and picker
- **harpoon** - Quick file navigation
- **nvim-cmp** - Completion engine
- **trouble.nvim** - Diagnostics list
- **which-key.nvim** - Keybinding help

## Configuration Guidelines

- **Indentation**: 2 spaces (configured in `lua/config/options.lua`)
- **Leader Keys**: Space (mapleader), Backslash (maplocalleader)
- **Plugin Loading**: Lazy-loaded based on events for optimal startup time
- **LSP Configs**: Add new language servers to `ensure_installed` in mason.lua and create config file in `lua/core/lsp/configs/`
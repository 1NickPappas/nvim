# CLAUDE_TODO.md

This file contains improvement tasks for the Neovim configuration, organized by language and feature.

## TypeScript/JavaScript Integration Improvements

### 1. Enable ESLint Linting
- [ ] Uncomment and configure `nvim-lint` in `lua/plugins/formatter.lua`
- [ ] Set up ESLint auto-commands for real-time linting
- [ ] Test ESLint integration with TS/JS files

### 2. Enhanced TypeScript LSP Settings
- [ ] Add inlay hints configuration to `lua/core/lsp/configs/ts_ls.lua`
- [ ] Enable auto-import suggestions
- [ ] Configure import organization settings
- [ ] Add TypeScript-specific completion settings

### 3. Import Management
- [ ] Add organize imports keymap (`<leader>oi`)
- [ ] Add remove unused imports keymap (`<leader>ou`)
- [ ] Add auto-import on completion settings
- [ ] Configure import sorting preferences

### 4. Advanced TS/JS Tools
- [ ] Consider adding `typescript-tools.nvim` for enhanced experience
- [ ] Add package.json schema validation
- [ ] Set up npm script integration
- [ ] Configure debugger support (nvim-dap) for Node.js/TS

### 5. Project-Specific Enhancements
- [ ] Add support for monorepo TypeScript projects
- [ ] Configure path mapping for absolute imports
- [ ] Add support for different TS config files (tsconfig.json variants)

## Rust Integration Improvements

### 1. Enhanced Rust Analyzer Settings
- [ ] Review and optimize `lua/core/lsp/configs/rust_analyzer.lua` settings
- [ ] Add cargo check on save configuration
- [ ] Enable proc macro expansion
- [ ] Configure inlay hints for Rust

### 2. Cargo Integration
- [ ] Add cargo run/test/build keymaps
- [ ] Set up cargo watch integration
- [ ] Add cargo.toml schema validation
- [ ] Configure cargo clippy integration

### 3. Rust-Specific Tools
- [ ] Verify rustfmt configuration and settings
- [ ] Add cargo-expand integration for macro debugging
- [ ] Set up rust-analyzer code lens features
- [ ] Add support for Rust documentation generation

### 4. Testing and Debugging
- [ ] Configure nvim-dap for Rust debugging
- [ ] Add cargo test runner integration
- [ ] Set up benchmark running capabilities
- [ ] Add support for criterion benchmarks

### 5. Advanced Rust Features
- [ ] Configure crate.io integration for dependency management
- [ ] Add support for cross-compilation targets
- [ ] Set up Rust documentation lookup
- [ ] Add macro expansion preview capabilities

## General Development Environment

### 1. Additional Language Servers
- [ ] Review and add missing language servers for other file types
- [ ] Configure JSON/YAML schema validation
- [ ] Add Markdown LSP for documentation
- [ ] Set up Dockerfile and Docker Compose LSP

### 2. Testing Framework Integration
- [ ] Add test runner integration (language-agnostic)
- [ ] Set up test result display in quickfix/trouble
- [ ] Add test coverage display capabilities
- [ ] Configure test file navigation

### 3. Debugging Improvements
- [ ] Set up nvim-dap for multiple languages
- [ ] Add debugging keymaps and UI configuration
- [ ] Configure breakpoint management
- [ ] Add variable inspection capabilities

## Priority Order

**High Priority:**
1. Enable ESLint linting (TS/JS)
2. Enhanced TypeScript LSP settings
3. Import management for TS/JS
4. Rust Analyzer optimization

**Medium Priority:**
1. Advanced TS/JS tools
2. Cargo integration improvements
3. Debugging setup
4. Testing framework integration

**Low Priority:**
1. Additional language servers
2. Advanced Rust features
3. Monorepo support
4. Documentation generation

## Notes

- Focus on one language at a time for systematic improvement
- Test each enhancement thoroughly before moving to the next
- Consider project-specific needs when implementing features
- Keep configurations maintainable and well-documented
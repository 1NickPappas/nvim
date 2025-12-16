# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Neovim Configuration Structure

Modern Neovim configuration using Lazy.nvim. Key paths:

- `init.lua` - Entry point: sets leader keys, loads options, bootstraps Lazy.nvim
- `lua/config/options.lua` - Editor options (2-space indentation, line numbers, clipboard)
- `lua/config/lazy.lua` - Lazy.nvim bootstrap and plugin loading
- `lua/core/lsp.lua` - Centralized LSP configuration with global keymaps
- `lua/core/lsp/configs/` - Per-server LSP configurations (auto-discovered)
- `lua/plugins/` - Individual plugin specifications

## LSP Architecture

The LSP uses a centralized pattern with auto-discovery:

1. `lua/core/lsp.lua` defines global `on_attach` with keymaps and capabilities (via cmp_nvim_lsp)
2. Server configs in `lua/core/lsp/configs/{server_name}.lua` are auto-loaded and merged
3. Mason handles installation; mason-lspconfig bridges to nvim-lspconfig
4. **Supported**: Lua (lua_ls), Rust (rust_analyzer), TypeScript/JavaScript (ts_ls), Haskell (hls), Move (move_analyzer)

### Adding a New LSP Server

1. Add server name to `ensure_installed` in `lua/plugins/mason.lua`
2. Create `lua/core/lsp/configs/{server_name}.lua` returning a config table
3. The config will be auto-merged with global `on_attach` and `capabilities`

## Key Bindings

### LSP (buffer-local when attached)
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gt` | Go to type definition |
| `gi` | Go to implementation |
| `gr` | Go to references |
| `K` | Hover documentation |
| `gs` | Signature help |
| `<C-k>` (insert) | Signature help |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>lf` | Format (async) |
| `<leader>ld` | Show diagnostic float |
| `<leader>q` | Send diagnostics to loclist |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |

### Diagnostic Navigation
| Key | Action |
|-----|--------|
| `[d` / `]d` | Previous/next diagnostic |
| `[e` / `]e` | Previous/next error |
| `[w` / `]w` | Previous/next warning |
| `[h` / `]h` | Previous/next hint |

### Rust-Specific (rust_analyzer buffers only)
| Key | Action |
|-----|--------|
| `<leader>rc` | `cargo check` |
| `<leader>rr` | `cargo run` |
| `<leader>rt` | `cargo test` |
| `<leader>rb` | `cargo build` |
| `<leader>rR` | `cargo run --release` |
| `<leader>rB` | `cargo build --release` |
| `<leader>rm` | Expand macro |
| `<leader>re` | Explain error |

### Telescope
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |

### Harpoon (quick file navigation)
| Key | Action |
|-----|--------|
| `<leader>a` | Add file to harpoon |
| `<C-e>` | Toggle harpoon menu |
| `<C-h/t/n/s>` | Jump to harpoon slot 1/2/3/4 |
| `<leader>hp/hn` | Previous/next harpoon file |

### Snacks.nvim
| Key | Action |
|-----|--------|
| `<leader>e` | File explorer (cwd) |
| `<leader>E` | File explorer (config) |
| `<leader>gg` | Open LazyGit |
| `<leader>sf` | Find files (Snacks picker) |
| `<leader>sg` | Live grep (Snacks picker) |

### Trouble (diagnostics panel)
| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle all diagnostics |
| `<leader>xX` | Toggle buffer diagnostics |
| `<leader>cs` | Toggle symbols |
| `<leader>cl` | Toggle LSP definitions/references |

## Formatting & Linting

- **conform.nvim**: Format-on-save (500ms timeout, LSP fallback)
  - Lua: stylua
  - Rust: rustfmt
  - JS/TS/JSON/YAML/MD/HTML/CSS: prettier
- **nvim-lint**: ESLint (eslint_d) for JS/TS on BufEnter/BufWritePost/InsertLeave

## Configuration Style

- **Indentation**: 2 spaces
- **Leader**: Space (`mapleader`), Backslash (`maplocalleader`)
- **Plugins**: Lazy-loaded via events where possible
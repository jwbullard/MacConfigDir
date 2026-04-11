# Neovim Configuration Notes

## Migration from lazy.nvim to vim.pack.add (Neovim 0.12)

This configuration was migrated from lazy.nvim to Neovim 0.12's built-in
`vim.pack.add` plugin manager.

### Issues Fixed During Migration

| File | Issue | Fix |
|------|-------|-----|
| `lua/plugins/blink.lua` | Incomplete URL `"https://github.com/micangl/"` | Changed to `"https://github.com/micangl/cmp-vimtex"` |
| `lua/plugins/context.lua` | Org-level URLs missing repo names | Added full paths: `nvim-treesitter/nvim-treesitter` and `nvim-treesitter/nvim-treesitter-context` |
| `lua/config/snippets.lua` | `vim.cmd()` calls inside the `set_config()` table | Moved keymapping `vim.cmd()` calls outside the config table; also fixed `"Textchanged"` to `"TextChanged"` |
| `lua/plugins/vimtex.lua` | Old lazy.nvim `return {}` format | Converted to `vim.pack.add` + top-level `vim.g` settings |
| `lua/plugins/lualine.lua` | `require("lazy.status")` — lazy.nvim not installed | Removed the lazy.nvim status integration |
| `lua/plugins/vim-tmux-navigator.lua` | `require("vim-tmux-navigator").setup()` on a VimScript plugin | Removed the require/setup; used `vim.keymap.set` for keybindings directly |
| `lua/plugins/treesitter.lua` | `config` callback not supported by `vim.pack.add`; old treesitter API (`get_module`) no longer exists | Simplified to just `vim.pack.add` |
| `lua/plugins/blink.lua` | `"vimtex"` and `"codeium"` listed as sources but not configured as providers | Added `blink.compat` setup and a `vimtex` provider using `blink.compat.source` |
| `lua/plugins/blink.lua` | Rust fuzzy matching library not built | Built with `cargo build --release` in the blink.cmp directory |

### Keymaps Restored from Old Configuration

| Keymap | Action | File |
|--------|--------|------|
| `<leader>nh` | Remove search highlights | `lua/config/keymaps.lua` |
| `x` | Delete without yanking | `lua/config/keymaps.lua` |
| `<leader>sv` / `<leader>sh` / `<leader>sx` | Split vertical / horizontal / close | `lua/config/keymaps.lua` |
| `<leader>bn` / `<leader>bp` | Next / previous buffer | `lua/config/keymaps.lua` |
| `<leader>b` | Show and pick buffer | `lua/config/keymaps.lua` |
| `<leader>jq` | Format JSON with jq | `lua/config/keymaps.lua` |
| `<leader>cc` | Close quickfix window | `lua/config/keymaps.lua` |
| `<leader>li` | LSP information | `lua/config/keymaps.lua` |
| `<leader>lr` | LSP rename symbol | `lua/config/keymaps.lua` |
| `<leader>ls` / `<leader>lk` | LSP signature help | `lua/config/keymaps.lua` |
| `<leader>lf` | LSP format | `lua/config/keymaps.lua` |
| `<leader>ld` | Open diagnostics float | `lua/config/keymaps.lua` |
| `<leader>lq` | Diagnostics to loclist | `lua/config/keymaps.lua` |
| `K` | LSP hover | `lua/config/keymaps.lua` |
| `g[` / `g]` | Previous / next diagnostic | `lua/config/keymaps.lua` |
| `<leader>oo` | Oil floating window | `lua/plugins/oil.lua` |
| `-` | Open parent directory (Oil) | `lua/plugins/oil.lua` |
| `<localleader>ls` | Vimtex forward search | `lua/plugins/vimtex.lua` |
| `<localleader>wc` | Vimtex word count | `lua/plugins/vimtex.lua` |
| `<leader>mp` | Format file or range | `lua/plugins/conform.lua` |

### Plugins Not Migrated

These plugins from the old lazy.nvim config were not migrated. They can be
added using the same `vim.pack.add` pattern if needed in the future.

| Plugin | What it provides |
|--------|-----------------|
| flash.nvim | `s`, `S`, `r`, `R`, `<c-s>` (jump / treesitter search) |
| gitsigns.nvim | `<leader>gp` (preview hunk), `<leader>gt` (toggle blame) |
| trouble.nvim | `<leader>xx/xX/cs/cl/xL/xQ` (diagnostics) |
| nvim-ufo + promise-async | `zR` / `zM` (open/close all folds), `zK` (peek fold) |
| nvim-lint | `<leader>li` (trigger lint) |
| diffview.nvim | `<leader>dv` / `<leader>dh` (diff view / history) |
| vim-fugitive + vim-flog | Git commands and log viewer |
| windows.nvim | Auto-resize windows |
| smear-cursor.nvim | Animated cursor movement |
| quarto-nvim | Quarto document support |
| hardtime.nvim | Was disabled in old config |

## Maintenance Reminders

- **After updating blink.cmp**, re-run `cargo build --release` in
  `~/.local/share/nvim/site/pack/core/opt/blink.cmp/`
- **After updating mason-lspconfig**, you may need to run `:MasonInstall` if
  new LSP servers need installing

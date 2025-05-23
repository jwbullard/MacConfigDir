return {
  {
    -- add blink.compat
    "saghen/blink.compat",
    version = "0",
    lazy = true,
    opts = {},
  },

  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    -- use a release tag to download pre-built binaries
    version = "*",
    dependencies = {
      { "L3MON4D3/LuaSnip", version = "v2.*" },
      "rafamadriz/friendly-snippets",
      "micangl/cmp-vimtex",
      "Exafunction/codeium.nvim",
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "vimtex", "codeium" },
      providers = {
        lsp = {
          name = "LSP",
          module = "blink.cmp.sources.lsp",
          enabled = true,
          async = false,
          score_offset = 1000,
        },
        vimtex = {
          name = "vimtex",
          module = "blink.cmpat.source",
          score_offset = 700,
        },
        codeium = {
          name = "codeium",
          module = "blink.compat.source",
          score_offset = 800,
        },
        buffer = {
          name = "buffer",
          module = "blink.compat.buffer",
          score_offset = 1,
        },
      },
    },

    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = {
        preset = "super-tab",
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<tab>"] = { "accept", "fallback" },
      },
      snippets = { preset = "luasnip" },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
          window = {
            border = "single",
          },
        },
        menu = {
          border = "single",
        },
      },
      signature = { window = { border = "single" } },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },
    },
    opts_extend = { "sources.default" },
  },
}

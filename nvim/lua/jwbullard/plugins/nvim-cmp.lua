return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    "micangl/cmp-vimtex",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- load vs-code like snippets from plugins
    -- require("luasnip.loaders.from_vscode").lazy_load()

    luasnip.config.set_config({ -- setting Luasnip config
      -- Enable autotriggered snippets
      enable_autosnippets = true,
      -- Update more often, :h events for more info.
      updateevents = "TextChanged,TextChangedI",
      store_selection_keys = "<Tab>",
    })

    vim.cmd([[
    " Expand or jump in insert mode
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 

    " Jump forward through tabstops in visual mode
    imap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'
    smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'

    " Jump backward through snippet tabstops with Shift-Tab (for example)
    imap <silent><expr> kj luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : 'kj'
    smap <silent><expr> kj luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : 'kj'
    ]])

    vim.opt.completeopt = "menu,menuone,noselect"

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
        { name = "vimtex" }, -- LaTeX
      }),
    })
  end,
}

return {
  {
    "neovim/nvim-lspconfig",
    event = "VimEnter",
  },
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
    },
    opts = {
      ensure_installed = {
        "basedpyright",
        "ruff",
      },
    },
    -- This config function is new. Don't know if it helps or makes worse
    config = function()
      require("mason").setup({})
      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
          lua_ls = function()
            require("lspconfig").lua_ls.setup({
              settings = {
                Lua = {
                  telemetry = {
                    enable = false,
                  },
                },
              },
              on_init = function(client)
                local join = vim.fs.joinpath
                local path = client.workspace_folders[1].name

                -- Don't do anything if there is project local config
                if vim.uv.fs_stat(join(path, ".luarc.json")) or vim.uv.fs_stat(join(path, ".luarc.jsonc")) then
                  return
                end

                local nvim_settings = {
                  runtime = {
                    -- Tell the language server which version of Lua you're using
                    version = "LuaJIT",
                  },
                  diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { "vim" },
                  },
                  workspace = {
                    checkThirdParty = false,
                    library = {
                      -- Make the server aware of Neovim runtime files
                      vim.env.VIMRUNTIME,
                      vim.fn.stdpath("config"),
                    },
                  },
                }

                client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, nvim_settings)
              end,
            })
          end,
        },
      })
    end,
  },
}

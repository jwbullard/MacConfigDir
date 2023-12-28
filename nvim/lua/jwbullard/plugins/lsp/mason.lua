  return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "",
          package_pending = "󰌚",
          package_uninstalled = ""
        }
      }
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "clangd",
        "fortls",
        "html",
        "jsonls",
        "lemminx",
        "lua_ls",
        "pyright"
      },

      -- auto-install configured servers with lspconfig
      automatic_installation = true,
    })

--    mason_null_ls.setup({
      -- list of formatters and linters for mason to install
--      ensure_installed = {
--        "prettier",
--        "stylua",
--        "chktex",
--        "clang_format",
--        "cmake_format",
--        "cmake_lint",
--        "cppcheck",
--        "cpplint",
--        "fixjson",
--        "textidote",
--        "tidy",
--      },

      -- auto-install configured servers with null_ls
--      automatic_installation = true,
--    })
  end
}

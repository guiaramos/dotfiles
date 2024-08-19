return {
  {
    "neovim/nvim-lspconfig",
    ft = "typescript",
    opts = {
      servers = {
        vtsls = {
          init_options = { hostInfo = "neovim" },
          settings = {
            typescript = {
              tsdk = "./.yarn/sdks/typescript/lib",
              -- @link https://github.com/yioneko/vtsls/blob/main/packages/service/configuration.schema.json
              inlayHints = {
                parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = false },
              },
            },
          },
        },
      },
      setup = {
        vtsls = function(_, _opts)
          require("lazyvim.util").lsp.on_attach(function(client)
            -- disable vtsls formatting to prevent conflict with prettier
            if client.name == "vtsls" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    ft = "typescript",
    ---@class ConformOpts
    opts = {
      formatters = {
        prettier = {
          command = function(self, bufnr)
            local util = require("conform.util")
            -- use project version of prettier instead builtin
            local cmd = util.find_executable({ ".yarn/sdks/prettier/bin/prettier.cjs" }, "")(self, bufnr)

            if cmd ~= "" then
              return cmd
            end

            -- return type of util.from_node_modules is fun(self: conform.FormatterConfig, ctx: conform.Context): string
            ---@diagnostic disable-next-line
            return util.from_node_modules("prettier")(self, bufnr)
          end,
        },
      },
    },
  },
}

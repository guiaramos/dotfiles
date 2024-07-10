return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          any = {
            { event = "msg_showmode" },
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
            { find = "written" },
          },
        },
        view = "mini",
      })

      table.insert(opts.routes, {
        filter = {
          any = {
            { event = "msg_showmode" },
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
            { find = "written" },
          },
        },
        view = "mini",
      })

      opts.presets.lsp_doc_border = false
    end,
  },
}
